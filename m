Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186679;
	b=ittt9wQ+YjEEw3fgQYGdAhEoCCMHl1TQsOTl54U18H2ntIvf5jQlHN73IIXBm/vJfc2Y
	 kBSGxa+gsFqwABUtRk96t9VYDzdmyF67OlXvmgdTO5LMVtPtPZzWyKp3jFxw2oCA26gA5
	 EfcEr+gWtYJydSkc9PfoDHbnBMg6STEaB7SM2H+kSDCCwe6KM9+ucqmI6g4fyD7CvjW0b
	 gwejfDoT8qmULoivptIii6oAPEby0cVXd3XzRXmEQ/8gKcwsf3H2ipVxBU6YX38CEi5Jv
	 TXkl9Jv+AQ0lSjn62PCDN0cOdtil9JjURFHh8dgbag0nbYY0vT2pOwGdG9JLbF+OLEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186679;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=LpTMZrMpU8imGYlY/D1QR/ruFBFP2CHJh6aE+gMArbA=;
	b=xE+9vjqPb9DX2DZ7YJoEhC4mCYmj+WJr1AVgbdVf3CeNylRMy4Mkf68/lnGTM4kZI+/S
	 pwE41I4VvPVke1y91hhldWcLHzFlvn7yNp/cRWoYzgf7+QTznADIzkAlGMomMrW2A7llb
	 iR4xwDzTT7J7SBs0rCcpAFRCnO4bZ+hIG+ot2nltiJKYpvr4RDijZGq1Xhk+66aQ5xGZK
	 HaLaJVREHm7SsUGlbJbXI4o2ApHiyiXFY7ceGqkw2b00OsWNbZgTAwPkgkmbRtE81sJF+
	 DmdWl5bF+kbfqIQ1keS8VME4qajnH77VHLF3Bg0V+5TGzgOY2xLB/kWiRbEwTkxAf7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cE3HB3R3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164F9606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cE3HB3R3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9701F000D8;
	Fri, 20 Nov 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186678;
	bh=LpTMZrMpU8imGYlY/D1QR/ruFBFP2CHJh6aE+gMArbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cE3HB3R3DCveyZJNyMDyYD8XYfy+DG7v3NX1SpPRXEf88YkHxdU3usdaD8v4dlaBt
	 VQRcUpZYHLxKfaksyfssuc6Vp9wgpvNdGCW1B0SNlCEdsA9392Om9bJGXCycPrCEBs
	 0ZZeIDb7ocTVyU8P2V9XmsfitpHsd4Lt9xyXMO/RETxba6WwYR4PKisvCHrQ27yyLu
	 MVBv4mEHhVYYjaMrhgb9gAPdyMX4tDdIW2q7LjKc/fEhlMsjE0ZrRhqTCKBAU0hsiZ
	 So0hglc6BOTS3RJfVRue+OF+Z5QyTNF+ZI2kSN85AKhKhrfqnOCw2m/fxTvcjqcdnW
	 9zdTAxKj55aBw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:25 -0600
Subject: [PATCH v5 01/19] accel: ethosu: Prevent command stream export
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ethosu-fixes-v5-1-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Command stream BOs are validated at creation time, but the generic PRIME
export path can expose their backing memory to a DMA-BUF importer. The
importer can then modify the command stream before the NPU executes it.

Reject PRIME export for validated command stream BOs while retaining
generic export for data BOs.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v3:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 9afe2549ec84..c046aee42687 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -6,6 +6,7 @@
 #include <linux/slab.h>
 
 #include <drm/ethosu_accel.h>
+#include <drm/drm_prime.h>
 
 #include "ethosu_device.h"
 #include "ethosu_gem.h"
@@ -30,9 +31,18 @@ static int ethosu_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vm
 	return drm_gem_dma_object_mmap(obj, vma);
 }
 
+static struct dma_buf *ethosu_gem_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_ethosu_bo(obj)->info)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 static const struct drm_gem_object_funcs ethosu_gem_funcs = {
 	.free = ethosu_gem_free_object,
 	.print_info = drm_gem_dma_object_print_info,
+	.export = ethosu_gem_export,
 	.get_sg_table = drm_gem_dma_object_get_sg_table,
 	.vmap = drm_gem_dma_object_vmap,
 	.mmap = ethosu_gem_mmap,

-- 
2.53.0

