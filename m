Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296183;
	b=1lFnIdEVftIpx//pKzpRytxzlJUfDWk/yVb/4+Vb6H2v8zou+HaPvNthZYLV3utV1eRP
	 Q9BCnnshTho7Kz+vDJNq8d64WXUcxHoeYgJo7SnERndAOaM+23YygFOWfly9zOEKhEWDj
	 6YHAXSWP0lEj8yVijytxwn7L6XntBJKtKeYrLdobjFY4pWxBDXe37OZlle3W8Ohn5VAd1
	 brOwsCUKtxfJP/nZbaM+lSGWMrNCbeEjMzPRch45pf1k244Q65y37tOeveZB9xYaWPZ7a
	 VD7NXH07q65eSmObl3TwmgAVTtAZNzp8s3jIVv5E/n70EjqoeCwT6oQJBrOX2vL2wiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296183;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ic8hpy/DzzKThKZxRlGT3Qexz29wBpDBzwWYSWNK43s=;
	b=4G1dd9CY3RjVP3k2/s9i2VW8d3WLmDRLujzWJiwEwPOIhmF0626Oxfqey3Xva+ydN6jw
	 cXedCTpNFRJiaACycdPpb9y5izL6Ik8uXg9PZo5bC3Sgh4waOo0GcZb9OTeEJX8xnmulu
	 2KJF9zZxx/kyG2ay8jSA85AxRuoKW6cmYdQXxA5jM5Jo5wOpUcFRhQJW24OjR7bz6wm00
	 uAeMlXVWF/t1TcPxT9Kav3yNLMbmKKexsJEx614SgJTa/VXueuE+oPqNtrijVY3bpXHd0
	 9t6vwkh8ede/Lhg7y4cOp2VEZBu2GDmTbHNi+yvrh+uLAApXtD72AjcOUorfL6cVgxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ly9Cjh5E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DEA606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ly9Cjh5E
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296183;
	b=IasdT7YmvZJyH2eJoz1Apbt8gp3W9Wv4zNP3rsdvnzMt3KPCNTupDZQeytb0geyiqlh2
	 0YEFGYK9/nsKGrKKT6R0Z0a6lq0NtAUVeolImI9x5bfUCBLiOALpSHuosUmdi6unYyZ5T
	 ZiE+oLSzksvw6NcemaY2v3B2EOnHw+rHi+fUzZFJSKStpZ9hrBuL4d9VLulJgqimaGX4f
	 62jWpEaVqzhmqdkCmzNeHY0M8PPzu0qN/9Eo83x2BH7ItpIe4RU5FXTxfiTy7AmcJmdrB
	 9gaOVZq3YcCQLDKQReNxfAl1ftvxp1rX4+LYzSPAOENLQ1RJ5/4yRfkpFlk9N9c8Z9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ic8hpy/DzzKThKZxRlGT3Qexz29wBpDBzwWYSWNK43s=;
	b=qHv4DvvLvEu+Bnd5aTRet7PCEyYO9K4xWpjSV3IWmoiwwRTAVkKjXjXP793QslAwEgkp
	 b2LSRV4J8Kqn087MgmAmnu0/ymwhLC9+Od3uNmVQWMrWo8G+bhNIEkuQ66S3CBrwj8Uqv
	 qOSaqkCdhHEOdAAbimFZoD8jRXg4TO+O2xaEXRXiMOqy/Ulk7sUK2e89pfX5IGOBFDw7D
	 gpsBTiF7f4Ej0WjI1dczwCMiinIxpy3cJPX3N827mc8Q37FzwYrwmN1CobPXv3eckj7Jy
	 YK9bjR2xh/HyyN/Jt6DWtab8mnpStv+NbmntpJr7mehQZC5WbkJLefAb3Lo9p+M0Y0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B07E1F000D2;
	Sat, 21 Nov 2026 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296183;
	bh=Ic8hpy/DzzKThKZxRlGT3Qexz29wBpDBzwWYSWNK43s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ly9Cjh5Er1sy5wlmMF5wGaCiDODSZVu1i9NmqY7XNOaWRNyo8EGgnRV8YYF8UbJgY
	 FyFZ28MK3tIDqI3AagxSDLyO3g4KYOYyjnCYOGBCYLSOEbjKjC2gNrV9cClVlDwIKg
	 5XCyvqALPZC9tt+3d0phrbIIuiyGeDzPgQX6LNEyap6K9OKhhFxUZvoS7JP6zOqRma
	 E8o/boSDt3i81po+KXXaMOtIr4lHgdKA7Id32g3vfdniDOkFW3QLZnQKgBjY5zL4cc
	 KjSnBy10KcprMln1BNalopxS8eg/UKmn65ZL2XvBzaQrP1cXfHJiOsc2QZ/LjdGnvS
	 y2GdU4gU84Iuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6078B4BDE0;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:22:58 -0700
Subject: [PATCH v3 5/6] drm/print,dyndbg: restore __drm_debug to uint from
 ulong
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
Message-Id: <20261121-rd-mostly-v3-5-89e74b23b491@gmail.com>
References: <20261121-rd-mostly-v3-0-89e74b23b491@gmail.com>
In-Reply-To: <20261121-rd-mostly-v3-0-89e74b23b491@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296180; l=5128;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=jvtUrAcvfC0M5/oracS++d2aBUCCnKRON82NJHdhrJA=;
 b=zauwhaAR+NZMYkOVk3OxHMJlX9SExHAbR0J1d3LV43PCQiiahmqw7kBY05XBk11I/83vP+7GS
 zeqeKJrIOTKBvYOquOgtQU1lVURUOB6D0tiLv0cuM1btUtpqPXoUREJ
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

Restore __drm_debug and struct ddebug_class_param.bits to uint from
ulong; 64 flags is more than we will ever need, and is not effectively
usable with the interface:

  # 64 bits would be unwieldly here
  echo 0x12345678 > /sys/module/drm/parameters/debug

drm_debug_bitmap.bits points at extern __drm_debug so dyndbg updates
it as shared state for drm_debug_enabled() and other ad-hoc debug
checks outside classmaps' remit. That pointer coupling requires
__drm_debug, module_param_named(..., uint), and
ddebug_class_param.bits to change together in one commit.

Accordingly, update lib/dynamic_debug.c to pass the local unsigned
long `old_bits` to ddebug_apply_class_bitmap() (which uses
test_bit()), format with 0x%x in param_get_dyndbg_classes(), and
shrink DD_SYS_WRAP's backing variable in lib/test_dynamic_debug.c to
unsigned int.

Fixes: b9400852c080 ("dyndbg: add drm.debug style (drm/parameters/debug) bitmap support")
Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

dyndbg: fix dd for __drm_debug shrink
---
 drivers/gpu/drm/drm_print.c   | 4 ++--
 include/drm/drm_print.h       | 2 +-
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 8 +++++---
 lib/test_dynamic_debug.c      | 2 +-
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 12b95901eb70..85847c01c95e 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -40,7 +40,7 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned long __drm_debug __read_mostly;
+unsigned int __drm_debug __read_mostly;
 EXPORT_SYMBOL(__drm_debug);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
@@ -56,7 +56,7 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 9 (0x200) will enable DRMRES messages (managed resources code)");
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-module_param_named(debug, __drm_debug, ulong, 0600);
+module_param_named(debug, __drm_debug, uint, 0600);
 #else
 /* classnames must match vals of enum drm_debug_category */
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 0805903c093b..d3c302a770e9 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -39,7 +39,7 @@ struct drm_device;
 struct seq_file;
 
 /* Do *not* use outside of drm_print.[ch]! */
-extern unsigned long __drm_debug;
+extern unsigned int __drm_debug;
 
 /**
  * DOC: print
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 05743900a116..dc21e3a8e86f 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 
 struct ddebug_class_param {
 	union {
-		unsigned long *bits;
+		unsigned int *bits;
 		unsigned int *lvl;
 	};
 	char flags[8];
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 18a71a9108d3..644f87d6969c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -681,8 +681,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
 			*dcp->bits = curr_bits;
+			old_bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
 			break;
@@ -754,7 +755,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		old_bits = *dcp->bits;
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, &old_bits);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -796,7 +798,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_DISJOINT_NAMES:
 	case DD_CLASS_TYPE_DISJOINT_BITS:
-		return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", *dcp->bits);
+		return scnprintf(buffer, PAGE_SIZE, "0x%x\n", *dcp->bits);
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..2fb9b3889f67 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -40,7 +40,7 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
  * - tie together sysname, mapname, bitsname, flagsname
  */
 #define DD_SYS_WRAP(_model, _flags)					\
-	static unsigned long bits_##_model;				\
+	static unsigned int bits_##_model;				\
 	static struct ddebug_class_param _flags##_model = {		\
 		.bits = &bits_##_model,					\
 		.flags = #_flags,					\

-- 
2.56.1


