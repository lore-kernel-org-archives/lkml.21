Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605859;
	b=UEhBlOManhQyMocrdJRtehHrF5DSlc1XEhOm1bMvv6QPhQDtk0F5cmDWCnhlumGZIfRJ
	 OKNSkIyxucF4xbWsZ6pQMCPpRxK2E370owBtOATPWSq1gQ9CBl8xwvV4AVh9n6gnMrOba
	 Oy4JANDn6NOEXyZtF+/zMoplaNtPjV8iDbOvQAD8JNH2TdBGLmaLbXYcmHxgl48TeOmkG
	 mZJeZJLh/tLCdbr8nkGgoMGNEQJF3WqAwnm3YqcO5YiQJxQN9JLIL53zlG7V47IoFNSuP
	 sIlVd/4b6LPpU94qhikXylZNVV4dCMMNc80EhKqyHVPBKrwfYqOO4Il3WJ0iZGhUxKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=bKcB04rSkuOWm7b4FPOKw09aZL7f06yLsTu8uJOudL4=;
	b=BpJU+4imCKus05Ku93zvBPRY0TGYyaQLOgD/tUK0hmz+tc0oSEzhKrSolRbBrvr/KaJv
	 7MGyaR3sonaT18ndTK+Jfn9EXnfeMoy7mPXGkg+JmaC6tWJKB/DMkvx20n5gVGdT/DRTx
	 J6M96fAjSwt62wI3qUhG2cD7Q/MUErgxwCRUQgzXZZYPbMYBBzOXfreSAubfvOMFcROXb
	 wkW77qHgMoSOGikoxjw+IP4V0lODSwjE/RTt6avHtafzoboV9j34Lwm3celvI3U9BaYkB
	 IGS/EVqOltGr0I3vzJQoK+Mxh/I9r8zEB/8s+0cDIapjN6oB5rg9+uBirDq0v2XSLQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfVphRJb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE0606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAAE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfVphRJb
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so6558865a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795605857; cv=none;
        d=google.com; s=arc-20260327;
        b=pZqQtVuJBNc0qRLBZBd28wCnSEVDEl0hA+Jr028Z9pD+dCRPObkJp3NloyWomz2tze
         1O/DyXwz4UzYihVEsHWp29SrwBzJCB2ejMJIle7hxu5vK2CsewJ66LUrppYvRcG5DEuW
         A990YyH1OlRQYfY41yQCzzC98hRlRd1oytFuOoAc4s/NwCtdGNB5gp/p4a70qLznOuD4
         qJry3rVrBAGJkEvORgRF0FFUe0wMKapI0/tKseFW0YPLjzIs7i3QQrM9nciS4PdU9t3M
         XKFSHyD6rGHvwK1obKnLsEJMqrdvfj9TjUpavwXVzOmVJsXQw8lagYEDYr2JenMLkLBc
         XYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bKcB04rSkuOWm7b4FPOKw09aZL7f06yLsTu8uJOudL4=;
        fh=0X7ZK0ARa+cHL6Sh5GkOM6dwIycJNS61OYH+mauA2qI=;
        b=BrqFYPt+MD5eBcJ0fi3Hbq1PmjVhgwxpOiZAjC0b1yZkM3acY6wdkJmWGxfglWGKCu
         QS31F/OAlQ0yS8j4hKjdCENunQO0o+yigl5rFFqu9uHdgfFobeWU1Hw1pvBy5x7H4dWh
         tFe+pWfRAVXRForTGX8OiR6qNE92QuHHfkv8Fch7HiU/mGVw6wgHWrqaYd1U+XZ175Fd
         MdQQzOln8V8WBTxKzqs+b3swGVyW8y9N3yzIV4Bi/IIN5W7nKKwFkqCibe9LIFQPCyO1
         THSSVZlJY0X95igAsWTbm7C8d7KQ/HSDgGT6CDpzQm6PUwerWfGQnSiAZfHkK4Wc2s+G
         w+Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605857; x=1796210657; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bKcB04rSkuOWm7b4FPOKw09aZL7f06yLsTu8uJOudL4=;
        b=nfVphRJb3kEHy0faZuAj67AmGjeBXlexTrbBshVTk+R7V25BCuDNrlFMWTU0PfZN3F
         x0n5o1A3cpTd943k8U+Jhs0Qkvc2AH8QeN0jKqNn0ZZzbKn/OV9NwsWwR3Oml0/euK7T
         QPEQq+ubZ8ckAAg33VLuWyAiKol836ptfX2nEM+HWkkuiNEJm0EiQYokAp6GtTHtN8t7
         S+kdoxRs/9rtId+/1dNGYOW9NB+dpHffLE0JCwjEbAjLLp4u7L4eGqEaZdIX5yFe7gVV
         dyPuC1U10VAtwa/+k+MpwzlDnpMFMtFOm9wKkpphBOBvpyYEAGrMa+To7a/YVpt7qyZ0
         FOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605857; x=1796210657;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKcB04rSkuOWm7b4FPOKw09aZL7f06yLsTu8uJOudL4=;
        b=v6KaB9nDvu7rR658kGrRNQTTAqK43AIDXSMtb/Yl34U0YKkJb4yZztzVjvz9h3hHdq
         124Cc941qU6DvM5zS0jfAM4kCSnM1Fvy/j3TUh8gfmYx416SNsrFUcYfBziNzmwx6/fh
         5sEP0cngRlewyVOL2wA/le9dRp4hy32pK5sYTEuTJA8RGLoLlBT/b+5PkhBdOKA2L8gD
         CQtXPJlnmwqPdqYgFIaS8Dhq2BWx0hkY+olZr9SNEUBKy4W5FOHh2IZzo1Mvgqw7lKsh
         yhO8meSAh+HR7ggN8jCDaHjKNjx0ou65WdCYEmDWEWfyaji5L18E+wxVWpvqxYTBeBSs
         vLrQ==
X-Forwarded-Encrypted: i=1; AL+hErFK7PnjbbWvkbxt+jf8EC6VWlPYW3WoxYiaslge/3uLcsa8BCLhdIdjUUkm+GZ8hj21oGbLeHd5PP75I+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JGQxIM+DJiVEoVGs7xLzRY7LBgSHXcQIOC7/cGU141l48diny
	wTcgLrKAbr/pn/Iqr05tSm514E9CLpdt17PBASvg7wmbAU3omWoiFbWN612tcQogdthHX+gIMQm
	BJ5hS0riXT+QUzyyuOJiM0TCBFai82vQ=
X-Gm-Gg: AZFdTZfYHgihs2Mepad61PlPQVQFowqZ6/qfMVv8UTN5hFQ8o+KXvrXW5XqW9nPS1bN
	H3rU1reTqvOvH82sRN0vraB/9dbYE2R90ecfLRMQm19pWvwEv5CQA2yg4NVIflTw5lX25xXg9ka
	Sj8ZL6m3wj5sO7EwQaqaQ0fpfOmH0D9oQGGLeQVgnoUAd1w/wd6bbobrgtLOS5bWjSkqG5dC7Pe
	WgU/6bM//kRFxz9SobDUR+0jFqd6dDvBafVFdXZOhJqC0w3ik4labFaCJCbpuKjuTaSd0V3B9uf
	VUJZ2CfxYECvppVwaPE7kIM3TP3SVYd3AWrreBkQI8uWri2RdIVvns+iBPGPz3lgecgQcbhV33f
	POq+4akz4kZhozMu+ORbSFXQQH0c/RfzCk/H3UsoH8cwaQSG1ptKNO1iq7nJFUKR+BTyhVvrDvG
	C950wUftYgO6pj7aajlPZkdKV+VHyNxFWOD3ZIM0HLq+YhtW9i
X-Received: by 2002:aa7:d287:0:b0:6bb:12db:8234 with SMTP id
 4fb4d7f45d1cf-6bb12db84e7mr1799402a12.2.1795605857019; Wed, 25 Nov 2026
 03:24:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Wed, 25 Nov 2026 14:24:34 +0300
X-Gm-Features: Aa3M54pJ_uqM-aO8I_etcGL7mZiC9V0bQpHkeguXT2AOfz945hpX194hsCU4hyw
Message-ID: <CAMnMt5aufzBXQvs2OeFpBqdh1_VgNUxstvkVX61dPPcfo94QOg@mail.gmail.com>
Subject: [PATCH] drm/ast: Optimize cursor updates and reduce overhead
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From f9574b5a246bf9021ea75f530a9a8ab7c9995274 Mon Sep 17 00:00:00 2001
From: Herman Semenoff <GermanAizek@yandex.ru>
Date: Tue, 24 Nov 2026 12:53:31 +0300
Subject: [PATCH] drm/ast: Optimize cursor updates and reduce overhead

On server platforms equipped with ASPEED BMC GPUs (such as AST2400 on
Lenovo RD450X), VRAM is mapped over a slow PCIe link with limited
bandwidth.

Currently, on every cursor move (e.g. via drmModeMoveCursor or atomic
commit updating plane coordinates without damage clips),
ast_cursor_plane_helper_atomic_update() invokes
drm_atomic_helper_damage_merged(). Because userspace does not provide
damage clips for pure cursor movements,
drm_atomic_helper_damage_iter_init() treats the absence of clips as a
full plane update. Consequently, on every mouse move event:
 1. ast_cursor_plane_get_argb4444() performs format conversion on CPU
 2. ast_set_cursor_image() recalculates 32-bit checksum on CPU
 3. memcpy_toio() pushes 8192 bytes over the slow PCIe link into VRAM
 4. Cursor base registers are reprogrammed

Fix this by only updating the cursor image and base when the image
actually changes (fb != old_fb, plane was previously invisible, or
damage clips were provided). For pure position updates, only update
the coordinates in the hardware cursor signature and registers,
skipping VRAM transfer, format conversion, and checksum calculation.

Additionally:
- Add DRM_FORMAT_XRGB8888 support to ast_cursor_plane_formats and handle
  it with opaque alpha in ast_cursor_plane_get_argb4444(), preventing
  compositors from unnecessarily falling back to software cursors on the
  primary plane
- Implement .panic_flush in ast_primary_plane_helper_funcs to disable the
  hardware cursor during kernel panics (CONFIG_DRM_PANIC)

Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 drivers/gpu/drm/ast/ast_cursor.c | 39 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/ast/ast_drv.h    |  1 +
 drivers/gpu/drm/ast/ast_mode.c   |  8 +++++++
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 690d4cd1db5e..883d1e6f20bd 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -142,7 +142,7 @@ static void ast_set_cursor_location(struct
ast_device *ast, u16 x, u16 y,
  ast_set_index_reg(ast, AST_IO_VGACRI, 0xc7, y1);
 }

-static void ast_set_cursor_enabled(struct ast_device *ast, bool enabled)
+void ast_set_cursor_enabled(struct ast_device *ast, bool enabled)
 {
  static const u8 mask = (u8)~(AST_IO_VGACRCB_HWC_16BPP |
      AST_IO_VGACRCB_HWC_ENABLED);
@@ -162,6 +162,7 @@ static void ast_set_cursor_enabled(struct
ast_device *ast, bool enabled)
 static const uint32_t ast_cursor_plane_formats[] = {
  DRM_FORMAT_ARGB4444,
  DRM_FORMAT_ARGB8888,
+ DRM_FORMAT_XRGB8888,
 };

 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
@@ -229,6 +230,30 @@ static const u8
*ast_cursor_plane_get_argb4444(struct ast_cursor_plane *ast_curs
  argb4444 = argb4444_dst[0].vaddr;
  }
  break;
+ case DRM_FORMAT_XRGB8888:
+ {
+ struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
+ IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
+ };
+ unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+ AST_HWC_PITCH,
+ };
+ unsigned int x, y;
+ u16 *dst16;
+
+ drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
+    shadow_plane_state->data, fb, clip,
+    &shadow_plane_state->fmtcnv_state);
+
+ for (y = clip->y1; y < clip->y2; y++) {
+ dst16 = (u16 *)(ast_cursor_plane->argb4444 +
+ y * AST_HWC_PITCH);
+ for (x = clip->x1; x < clip->x2; x++)
+ dst16[x] |= 0xf000;
+ }
+ argb4444 = argb4444_dst[0].vaddr;
+ }
+ break;
  }

  drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
@@ -261,13 +286,21 @@ static void
ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
  unsigned int offset_x, offset_y;
  u16 x, y;
  u8 x_offset, y_offset;
+ bool update_image;

  /*
  * Do data transfer to hardware buffer and point the scanout
- * engine to the offset.
+ * engine to the offset only if the cursor image actually changed
+ * or the plane became visible. For pure cursor moves, avoid
+ * expensive PCIe bus transfers, format conversion, and checksum
+ * calculation.
  */
+ update_image = (fb != old_plane_state->fb) ||
+       !old_plane_state->visible ||
+       drm_plane_get_damage_clips_count(plane_state);

- if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
+ if (update_image &&
+    drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
  const u8 *argb4444 = ast_cursor_plane_get_argb4444(ast_cursor_plane,
    shadow_plane_state,
    &damage);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 4f221b848d68..d846d5cf4f5e 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -542,6 +542,7 @@ int ast_sil164_output_init(struct ast_device *ast);
 /* ast_cursor.c */
 long ast_cursor_vram_offset(struct ast_device *ast);
 int ast_cursor_plane_init(struct ast_device *ast);
+void ast_set_cursor_enabled(struct ast_device *ast, bool enabled);

 /* ast dp501 */
 bool ast_backup_fw(struct ast_device *ast, u8 *addr, u32 size);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 08db132acae8..f94f849d157b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -639,6 +639,13 @@ static int
ast_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
  return -ENODEV;
 }

+static void ast_primary_plane_helper_panic_flush(struct drm_plane *plane)
+{
+ struct ast_device *ast = to_ast_device(plane->dev);
+
+ ast_set_cursor_enabled(ast, false);
+}
+
 static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
  DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
  .atomic_check = ast_primary_plane_helper_atomic_check,
@@ -646,6 +653,7 @@ static const struct drm_plane_helper_funcs
ast_primary_plane_helper_funcs = {
  .atomic_enable = ast_primary_plane_helper_atomic_enable,
  .atomic_disable = ast_primary_plane_helper_atomic_disable,
  .get_scanout_buffer = ast_primary_plane_helper_get_scanout_buffer,
+ .panic_flush = ast_primary_plane_helper_panic_flush,
 };

 static const struct drm_plane_funcs ast_primary_plane_funcs = {
-- 
2.55.0
