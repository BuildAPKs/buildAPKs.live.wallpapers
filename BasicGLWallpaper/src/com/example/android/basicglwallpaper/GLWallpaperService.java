/*
 * Copyright (C) 2011-2012 Learn OpenGL ES
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.example.android.basicglwallpaper;

import android.content.Context;
import android.opengl.GLSurfaceView;
import android.opengl.GLSurfaceView.Renderer;
import android.service.wallpaper.WallpaperService;
import android.util.Log;
import android.view.SurfaceHolder;

public abstract class GLWallpaperService extends WallpaperService {

	public class GLEngine extends Engine {
		class GLWallpaperSurfaceView extends GLSurfaceView {
			private static final String TAG = "GLWallpaperSurfaceView";

			GLWallpaperSurfaceView(Context context) {
				super(context);

				Log.d(TAG, "GLWallpaperSurfaceView(" + context + ")");
			}

			@Override
			public SurfaceHolder getHolder() {
				Log.d(TAG, "getHolder(): returning " + getSurfaceHolder());

				return getSurfaceHolder();
			}

			public void onDestroy() {
				Log.d(TAG, "onDestroy()");

				super.onDetachedFromWindow();
			}
		}

		private static final String TAG = "GLEngine";

		private GLWallpaperSurfaceView glSurfaceView;
		private boolean rendererHasBeenSet;

		@Override
		public void onCreate(SurfaceHolder surfaceHolder) {
			Log.d(TAG, "onCreate(" + surfaceHolder + ")");

			super.onCreate(surfaceHolder);

			glSurfaceView = new GLWallpaperSurfaceView(GLWallpaperService.this);
		}

		@Override
		public void onVisibilityChanged(boolean visible) {
			Log.d(TAG, "onVisibilityChanged(" + visible + ")");

			super.onVisibilityChanged(visible);

			if (rendererHasBeenSet) {
				if (visible) {
					glSurfaceView.onResume();
				} else {
					glSurfaceView.onPause();
				}
			}
		}

		@Override
		public void onDestroy() {
			Log.d(TAG, "onDestroy()");

			super.onDestroy();
			glSurfaceView.onDestroy();
		}

		protected void setRenderer(Renderer renderer) {
			Log.d(TAG, "setRenderer(" + renderer + ")");

			glSurfaceView.setRenderer(renderer);
			rendererHasBeenSet = true;
		}

		protected void setEGLContextClientVersion(int version) {
			Log.d(TAG, "setEGLContextClientVersion(" + version + ")");

			glSurfaceView.setEGLContextClientVersion(version);
		}
	}
}
