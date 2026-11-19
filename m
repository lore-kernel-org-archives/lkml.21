Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115460;
	b=MfSdPrR0/hGcmmS6Y24WR8WwnT1r/MsQtdZ8FXfvd7e0m6dG7n2z/jJDg6PVzkkm+4de
	 xWmujcV2k4eEw1UrBDPPj5GiuidXFi2GUWONzJCJuvfkmk7fiZBKZp8TZa2deQg8XKPGk
	 GYlpH8pMgAE8fvr1darx8Euj4KUnjCEiXcJAhhJIKMlLuCmueWz1eOsbd9QIvYVjJtJpJ
	 TOY1g2n3d0FyJFqcz8yqhRKalD1kIiKXYTEq0zT8G8J6Q3StKQnKhl3RvbhAADSa0L9zp
	 avlPyaLCrpFCs8wQnOaF2vbyS3ly/R6Ole7WYRy7nxKuNxKcnC0T6v9W4Dftv3Eckbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115460;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sxTn8M/3qOClZF/6JZR5B0g0BIIYkLPlXWXuH1LsA2g=;
	b=I1GEUvoT9tEdpBlZ/ktlfmYOSNebBv6coFockf1SEvzxa1yySMoBADBqnnF1rl+P4ZYh
	 JOWCkqBPTCl73jF5ri/B/nLnm9fVlRenncOuw6COGvPRFdg94xaAji2rm1ELmsguam6NK
	 5KL2R/ygedMHq2mGV6/ZUmoAZhWqWN4bJMu943rJqeH9F+GZPosROOynXeOZLfCiyQqq4
	 I2nVpotY147IEQ4KF/9tDN1fp6kfLonj3sxWoK3TLbZI+lzZmmZXIbUmrUlzuVqMtbARb
	 QVDdyaLIgPxZqYsIm0mDsP/MEfFMl+suAXYd1MwnUufP+DHO0VEGQG6l2PtmTFnht+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=MxnII4w0;
	arc=none smtp.remote-ip=91.218.175.89
Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEF60A260B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34BEF60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=MxnII4w0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AWOkBBAq/YXJUhDBoogWOzXz+yE7PZKM8xjPAy/bQ9M=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795115456; v=1; x=1795720256;
 b=MxnII4w0zaxTOJoEonw/Gh62OmKqWz4MsNYCsQtKuW8AszrboA4QWpVidKdKRztIRAwrk3t0
 bllrPUlnqGkaVYuCU+9drBOg9mTpvUf2zX9WotHe3otMFEcYi8hXOa2z+9huA06OYZp1KhoqH14
 4s1iBlYOxXwKCMaNOtVKPCLgUlUsFcgnLPQSfjbulMfovPa17H3B7AC0c0hgcMpyCPy9e5NGX2T
 uKqVtEXP7+CCUZN401Qe2S5N2PQ9MHkNANSczKhmNxgKfTTxpoHvr2AXc92Tcvc5Kz7vERdmoN9
 LAO91wrFYY/Epl/RenZYVWRHOetyQ14sQb2UzQsCoyn3w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58450e64729725f2;
	Thu, 19 Nov 2026 19:10:46 +0000
X-Mizu-Trace-ID: 58450e64729725f2
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	desobei <desobei@outlook.com>,
	luyuantao <luyuantao@kylinos.cn>
Subject: [PATCH] drm/panic: Bring back the kmsg screen fixes lost in a merge
Date: Thu, 19 Nov 2026 12:10:38 -0700
Message-ID: <20261119191038.146963-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b537d87d2632 ("drm/panic: Fix the loop that causes kmsg to not
display correctly") and commit 1ba640563843 ("drm/panic: Fix kmsg screen
hang on a long log line") changed the old panic file. By the time they
reached drm-fixes, that code had moved into the helper library, and the
merge left the helper as it was.

So the panic screen that prints the kernel log hangs again on a long
log line, and the machine never reboots. The helper's KUnit suite hangs
the same way.

Make both changes in the helper.

Fixes: 5c3d323984fd ("drm/panic: Move panic display code into helper library")
Reported-by: desobei <desobei@outlook.com>
Closes: https://lore.kernel.org/all/PH7PR19MB6658FDBDD012399C6E8D330FAF792@PH7PR19MB6658.namprd19.prod.outlook.com/
Tested-by: desobei <desobei@outlook.com>
Cc: luyuantao <luyuantao@kylinos.cn>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Both were lost in merge 1c3b1398f1cf. My other fix in that pull, for
the panic screen setting, made it through.

Panics with a long line in the log, on drm-misc-fixes:

                              without this    with this
    QEMU, 40 panics           all hang        all reboot
    AMD mini PC, 8 panics     all hang        all reboot

Panics with nothing long in the log reboot either way.

 drivers/gpu/drm/drm_panic_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_panic_helper.c
index 8913c3d22e8d..385a07ed314b 100644
--- a/drivers/gpu/drm/drm_panic_helper.c
+++ b/drivers/gpu/drm/drm_panic_helper.c
@@ -513,7 +513,8 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 	struct kmsg_dump_iter iter;
-	char kmsg_buf[512];
+	/* the size printk formats one record into, too big for the stack */
+	static char kmsg_buf[2048];
 	size_t kmsg_len;
 	struct drm_panic_line line;
 	int yoffset;
@@ -530,10 +531,15 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
 	drm_panic_helper_fill(sb, &r_screen, bg_color);
 
 	kmsg_dump_rewind(&iter);
-	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
+	while (yoffset >= 0 && kmsg_dump_get_buffer(&iter, false, kmsg_buf,
+	       sizeof(kmsg_buf), &kmsg_len)) {
 		char *start;
 		char *end;
 
+		/* a record that does not fit comes back empty, every time */
+		if (!kmsg_len)
+			break;
+
 		/* ignore terminating NUL and newline */
 		start = kmsg_buf + kmsg_len - 2;
 		end = kmsg_buf + kmsg_len - 1;
-- 
2.56.1

