Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203231;
	b=zFCSqXa7EXQ+Q/Uka7pK0VfthkCS9eYOiRDeJFiENUEfNQ+qDz7LBvYk7z/2I7gH/9o0
	 FvKVglakU87hCpNgrE9vVt34XxFDS5aMWPMO4wZRzRLXO5hk6Dx1LfDKQDMy1jZXjC6gu
	 E962YjZoDFCUNmw+SJOwA5u78LbspYe+kH6U2DPrB/pnLE/aZTGsob0CAAu67Bfx3Ph2N
	 t5gd2ILfOGbXnzMAkMdrd78MTvlq3sN6YJwM1YhldmNt8p95zPzYv/jxIgOxB7rWptXOS
	 1scb+RQMQV7QNIGegpItTNLFvMGCKg160SADeVC21jkRAv4XiWurzT8dn6lreu97Mxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vJ6tZtEnlK9qkgGnFkn4tgGXrQ/769dDFL4QlkxqQAg=;
	b=fRi4SxTsDSP4TL9KfXzK5eze00mTKtcp/xAIL18iQwD3n6A6FfbZeDfb8HwYM21GcAoF
	 BMHHOYKSwKtxzzuksaJMzRWYExlv9gOVCON04rdwAq01nqu7z+zuJvLdKqZS+Sh43B2Ak
	 NwYXF/qN6Yp4DyqjWXpFO8CPnVhXINvTIwVYvOE8PTc85kxpjfHuRP5SO/H7TKAXAKDT0
	 vU/ECqCxnD+vTz8sfkC1u4dBvvGNFuy/bOGI+ln6lQO6Pe7hqGBSpWQF66roeZM3tizYy
	 IPBxfvldga3Qhnzr1qyfbui8agSw0ACwQ8rJwZmtAKCH3SqrAbs3QmLZZj02e/5MfSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZacBeegc;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAC606A6D8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DAC606A6D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZacBeegc
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67dabd38cdfso1682042d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203229; x=1795808029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJ6tZtEnlK9qkgGnFkn4tgGXrQ/769dDFL4QlkxqQAg=;
        b=ZacBeegcAhcRPIBuOiayYZjO4NJu6Ea+XThnXc3Bi0hxDffypywzA5xzGzn4WyBSgn
         h3ZysKJZEu0sbUaDVXoYYqe6sR1wYo4f1flKXieGVhxXu9tgWFuVb0NI9Ht/YuYMpp0m
         gS3RD9z3y+9xH1eYWDmQ5cYgUs4+3JxfxV5n2pa0wETu1Ux8k0OR/S8de55ti48RWM4y
         6zNZscfy1OPXw+nWNIqG1DWkn19oEk8zg9vEn2NOLESKm4AERKaKs18/wsA0IjR9QQVn
         TD8gwNwaNxhVR0eGhJ9Gw3/esl/8R2M9q8vwSj0dx7vUA8A6FhHPwJm5lQr29p/JImoR
         bEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203229; x=1795808029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJ6tZtEnlK9qkgGnFkn4tgGXrQ/769dDFL4QlkxqQAg=;
        b=zDCz8pnY35u3gH2HGQG70n1rTERzFuLAYoKjkoY55M6qZT0fuNtEyMCqgMoZbJFbLm
         PX1V2H8cZq+EP8FFcWsOHaZkfYZCFEObCylf0szrYq3ND7WLmDX6iXvAiZkbeNzXBMiD
         py/CJSxnsknU5ZEPKcDLRJjWOw9CfrQvi7+G4tOMb+Z+x3KFIhTsf830F1wtaN+P4q88
         hyTsErrGl4IycWAYgfSESHobHcrpKlTG4r/84v6iedSCeIWcssArDaBQVwi3It3gMmT6
         mrLChJCb0IdRexcFeQ25Kas7Imi+2iorY2rxOgPxoO9ppi4hhhIKETU2aTHGMobnDI7a
         9V4w==
X-Forwarded-Encrypted: i=1; AL+hErFac33cy/jJUofOoHXIbnNe+Pgrdx/p9BwYqSfGY2CzTBq8VJ5mo/I3uCKl52kaDlbLgAPHlHGGiQX3WjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z93fAraytcpZCuexP0LvXmv0oeLQLlSGbWQJ/rNMUQPsr234QWZ
	grEiBMKWQemE2JzRDvYvGXBoxwVAfIAEKNreoJi5ZxPhoi0q0la5VWZg
X-Gm-Gg: AZFdTZe5Rgciarmkcm9BsaU0NCJQyXzxDCsXWAz8ZQ9lHA24s98OPWmzyhsIotn0biy
	yXthJUXil0PWK2SOGErvqESAecmW6LAjdMwOUY+hJJhUDO8SkMhcYmYNYbN0dwWxEYGKslY5kY9
	G9G3GH6XSzFEA/g/YzI19ZYYejqh+uY8pjjGSS9K3fOhvROrv/CjCBRsNQ2KhZZ3jlQmGSvL+HP
	NiXhxuJJ4ZDQDgpT5dR8MpDUj1Dmu24esCrK/vVPFSzy4Ev6TAAAXQQoq412jzmxI0brq5K2wV3
	5dwLSthkJtSh4o7yxukB43rroxanb1x/fOx7hggwqyI2ZwmHXOeSRKrb1um1kTjev+R77Bl/+AT
	HawsO2c5/1YwrJ1SmUxXHyRIniDzl423bb5YHLyrVt56UGZOpUMcVETl05it2ofSdyulQeg1JS6
	x9ke0inZ0c6uE6gOc5n8254RFpRfSPx6wj3a/+WDVl7wabHFD9Ze0ag8B/GgSwJvRdvDEQl5gVN
	n0lRNMExY//eANKdwQ1JGDpdl0Rnn2hjK9vJww3tCNsSvehQTF8/CrM8pIdxsiunMB+Dq1ndQ1+
	f7ihPO8iNkc10uHCeeufmN85Ny+N1RCZXbGuqLJZq/zoSDjlVo7guf4uEwHD6MuNxxBcOfMfqEL
	12QgIoSnsp20GnI8LiJtkZp28KrVJWTKkUOVAKDcM9Yc=
X-Received: by 2002:a05:690e:1187:b0:67d:ba3f:a9a6 with SMTP id 956f58d0204a3-67df43ce269mr1734293d50.21.1795203229219;
        Fri, 20 Nov 2026 11:33:49 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330bfb1sm2149725d50.6.2026.11.20.11.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:33:48 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 20 Nov 2026 14:33:43 -0500
Subject: [PATCH 4/4] EDAC/mpc7448_l2: Add error injection
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
Message-Id: <20261120-ppc32-l2-ecc-v1-4-98fc8e6e0a32@gmail.com>
References: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
In-Reply-To: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Matt Turner <mattst88@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-edac@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10492; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=XNCxMKgi+jdMDTi3VczwwKddmdxn919Rql+cTqKYU2o=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIZFkwJVOA03ix1b+0mh8z5HzWuKqjr3Tpac0XtzaxfJ
 usqPxqXdXxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1/swM/wynzjju9y
 F7m/Xil7N0tzyZMr9M8erChXxfeJlYg+aylQgx/I8Sefvp4+eZiWf7uT8wTp39an61zt/aTIn9h
 lFtTFbrJHgA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Expose the L2 error injection registers as inject_data_hi,
inject_data_lo and inject_ctrl.  Writing a CPU number to inject_trigger
injects the error into a private buffer on that CPU and reports what
was detected.

L2 machine checks are not recoverable, so machine check reporting is
masked while the injected errors are consumed.  Tag injection is not
offered: it corrupts the tags of unrelated lines too, and hung the
machine in testing.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/include/asm/reg.h |   1 +
 drivers/edac/mpc7448_l2_edac.c | 284 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 284 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 2f4adf5a606e..15c97ff8b12a 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -760,6 +760,7 @@
 #define L3CR_PMSIZ		0x00000001	/* L3 private memory size */
 
 #define SPRN_MSSCR0	0x3f6	/* Memory Subsystem Control Register 0 */
+#define   MSSCR0_L2PFE	0x00000003	/* L2 prefetch engines */
 #define SPRN_MSSSR0	0x3f7	/* Memory Subsystem Status Register 1 */
 #define   MSSSR0_L2TAG	0x00040000	/* L2 tag parity error */
 #define   MSSSR0_L2DAT	0x00020000	/* L2 data parity/ECC error */
diff --git a/drivers/edac/mpc7448_l2_edac.c b/drivers/edac/mpc7448_l2_edac.c
index a62c7a2e7147..157f6ff99cf6 100644
--- a/drivers/edac/mpc7448_l2_edac.c
+++ b/drivers/edac/mpc7448_l2_edac.c
@@ -11,12 +11,17 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cache.h>
 #include <linux/cpu.h>
 #include <linux/device/faux.h>
 #include <linux/edac.h>
+#include <linux/gfp.h>
+#include <linux/io.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/smp.h>
 #include <linux/sprintf.h>
+#include <linux/sysfs.h>
 
 #include <asm/mpc7448_l2.h>
 #include <asm/reg.h>
@@ -25,6 +30,32 @@
 
 #define DRV_NAME	"mpc7448_l2_edac"
 
+/*
+ * Injection buffer layout.  The target line is followed by aliases one
+ * L1 way (4 KB) apart, which map to the same L1 set and evict the target
+ * from the 8-way L1 into the L2.  With the L1's PLRU replacement, eight
+ * misses evict the target when nothing else touches its set; INJ_NALIAS
+ * is twice that.  The L2 is filled in 64-byte lines of two 32-byte blocks.
+ */
+#define INJ_STRIDE	4096
+#define INJ_NALIAS	16
+#define INJ_ORDER	get_order((INJ_NALIAS + 1) * INJ_STRIDE)
+#define INJ_PATTERN	0x12345678
+
+/*
+ * Tag injection (L2ERRINJCTL[TERRIEN]) is not offered: it also corrupts
+ * the tags of unrelated lines sharing the L2 sets that are written while
+ * injection is enabled, which hung the machine in testing.
+ */
+#define INJ_CTL_MASK	(L2ERRINJCTL_ECCMB | L2ERRINJCTL_DERRIEN | \
+			 L2ERRINJCTL_ECCERRIM)
+
+struct mpc7448_l2_pdata {
+	u32 inj_hi;
+	u32 inj_lo;
+	u32 inj_ctl;
+};
+
 static struct faux_device *mpc7448_l2_fdev;
 
 struct mpc7448_l2_poll {
@@ -98,11 +129,261 @@ static void mpc7448_l2_check(struct edac_device_ctl_info *edac_dev)
 	cpus_read_unlock();
 }
 
+struct mpc7448_l2_inj {
+	u32 *buf;
+	u32 hi;
+	u32 lo;
+	u32 ctl;
+	u32 val;
+	struct mpc7448_l2_poll poll;
+};
+
+static u32 *inj_alias(u32 *a, unsigned int i)
+{
+	return (u32 *)((char *)a + i * INJ_STRIDE);
+}
+
+/* Flush the L2 lines of aliases first to last from the L1 and L2 */
+static void inj_flush(u32 *a, unsigned int first, unsigned int last)
+{
+	unsigned int i;
+
+	for (i = first; i <= last; i++) {
+		dcbf(inj_alias(a, i));
+		dcbf((char *)inj_alias(a, i) + 32);
+	}
+	mb();	/* wait for the flushes to complete */
+}
+
+/* Change a mode SPR with no cache operations or stores in flight */
+#define inj_mtspr(rn, v)					\
+do {								\
+	mb();	/* complete earlier accesses first */		\
+	mtspr(rn, v);						\
+	mb();	/* and the SPR write itself */			\
+	isync();						\
+} while (0)
+
+/*
+ * Every L2 write while injection is enabled is corrupted, so keep the
+ * window short: modify the target in the L1, enable injection, cast the
+ * target out to the L2 by loading its aliases, and disable injection.
+ * The aliases are filled into the L2 during the window and take the error
+ * too.  Then flush the aliases, read the target back, and flush it.
+ */
+static noinline u32 mpc7448_l2_inject_window(u32 *a, u32 hi, u32 lo, u32 ctl)
+{
+	unsigned int i;
+	u32 val;
+
+	inj_flush(a, 0, INJ_NALIAS);
+
+	/*
+	 * A castout that misses in the L2 goes to memory, so load the target
+	 * to allocate its L2 line before modifying it in the L1.
+	 */
+	READ_ONCE(*a);
+	WRITE_ONCE(*a, INJ_PATTERN);
+	mb();	/* modify the target before injection starts */
+
+	mtspr(SPRN_L2ERRINJHI, hi);
+	mtspr(SPRN_L2ERRINJLO, lo);
+	mtspr(SPRN_L2ERRINJCTL, ctl);
+	mb();	/* start injection before the castout */
+
+	for (i = 1; i <= INJ_NALIAS; i++)
+		READ_ONCE(*inj_alias(a, i));
+	mb();	/* wait for the castout and the alias fills */
+
+	mtspr(SPRN_L2ERRINJCTL, 0);
+	mtspr(SPRN_L2ERRINJHI, 0);
+	mtspr(SPRN_L2ERRINJLO, 0);
+	mb();	/* stop injection before anything else reaches the L2 */
+
+	inj_flush(a, 1, INJ_NALIAS);
+	val = READ_ONCE(*a);
+	inj_flush(a, 0, 0);
+
+	return val;
+}
+
+static void mpc7448_l2_inject_cpu(void *info)
+{
+	struct mpc7448_l2_inj *inj = info;
+	u32 inten = mfspr(SPRN_L2ERRINTEN);
+	u32 msscr0 = mfspr(SPRN_MSSCR0);
+	u32 *a = inj->buf;
+
+	/* The prefetch engines would fill (and corrupt) other lines */
+	if (msscr0 & MSSCR0_L2PFE)
+		inj_mtspr(SPRN_MSSCR0, msscr0 & ~MSSCR0_L2PFE);
+
+	/*
+	 * A dry run without injection leaves only the buffer in the
+	 * target's L1 set and the window's code in the L1 instruction
+	 * cache, so nothing else is cast out to the L2 during the window.
+	 */
+	mpc7448_l2_inject_window(a, 0, 0, 0);
+
+	/* L2 machine checks are not recoverable, so poll for these errors */
+	inj_mtspr(SPRN_L2ERRINTEN, 0);
+
+	inj->val = mpc7448_l2_inject_window(a, inj->hi, inj->lo, inj->ctl);
+	mpc7448_l2_poll_cpu(&inj->poll);
+
+	inj_mtspr(SPRN_L2ERRINTEN, inten);
+	if (msscr0 & MSSCR0_L2PFE)
+		inj_mtspr(SPRN_MSSCR0, msscr0);
+}
+
+static ssize_t inject_show(u32 val, char *data)
+{
+	return sysfs_emit(data, "0x%08x\n", val);
+}
+
+static ssize_t inject_store(u32 *val, u32 mask, const char *data,
+			    size_t count)
+{
+	u32 v;
+	int ret;
+
+	ret = kstrtou32(data, 0, &v);
+	if (ret)
+		return ret;
+	if (v & ~mask)
+		return -EINVAL;
+
+	*val = v;
+	return count;
+}
+
+static ssize_t inject_data_hi_show(struct edac_device_ctl_info *edac_dev,
+				   char *data)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_show(pdata->inj_hi, data);
+}
+
+static ssize_t inject_data_hi_store(struct edac_device_ctl_info *edac_dev,
+				    const char *data, size_t count)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_store(&pdata->inj_hi, ~0U, data, count);
+}
+
+static ssize_t inject_data_lo_show(struct edac_device_ctl_info *edac_dev,
+				   char *data)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_show(pdata->inj_lo, data);
+}
+
+static ssize_t inject_data_lo_store(struct edac_device_ctl_info *edac_dev,
+				    const char *data, size_t count)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_store(&pdata->inj_lo, ~0U, data, count);
+}
+
+static ssize_t inject_ctrl_show(struct edac_device_ctl_info *edac_dev,
+				char *data)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_show(pdata->inj_ctl, data);
+}
+
+static ssize_t inject_ctrl_store(struct edac_device_ctl_info *edac_dev,
+				 const char *data, size_t count)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_store(&pdata->inj_ctl, INJ_CTL_MASK, data, count);
+}
+
+static ssize_t inject_trigger_store(struct edac_device_ctl_info *edac_dev,
+				    const char *data, size_t count)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+	struct mpc7448_l2_inj inj;
+	struct page *page;
+	unsigned int cpu;
+	int ret;
+
+	ret = kstrtouint(data, 0, &cpu);
+	if (ret)
+		return ret;
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	page = alloc_pages(GFP_KERNEL, INJ_ORDER);
+	if (!page)
+		return -ENOMEM;
+
+	inj.buf = page_address(page);
+	inj.hi = pdata->inj_hi;
+	inj.lo = pdata->inj_lo;
+	inj.ctl = pdata->inj_ctl;
+
+	cpus_read_lock();
+	if (cpu_online(cpu))
+		ret = smp_call_function_single(cpu, mpc7448_l2_inject_cpu,
+					       &inj, 1);
+	else
+		ret = -ENXIO;
+	cpus_read_unlock();
+
+	if (!ret)
+		edac_device_printk(edac_dev, KERN_INFO,
+				   "cpu%u: injected ctl 0x%08x data 0x%08x_%08x at 0x%llx: read 0x%08x (wrote 0x%08x)\n",
+				   cpu, inj.ctl, inj.hi, inj.lo,
+				   (unsigned long long)virt_to_phys(inj.buf),
+				   inj.val, INJ_PATTERN);
+
+	__free_pages(page, INJ_ORDER);
+
+	if (ret)
+		return ret;
+
+	mpc7448_l2_report(edac_dev, cpu, &inj.poll);
+	return count;
+}
+
+static const struct edac_dev_sysfs_attribute mpc7448_l2_sysfs_attributes[] = {
+	{
+		.attr = { .name = "inject_data_hi", .mode = 0600 },
+		.show = inject_data_hi_show,
+		.store = inject_data_hi_store,
+	},
+	{
+		.attr = { .name = "inject_data_lo", .mode = 0600 },
+		.show = inject_data_lo_show,
+		.store = inject_data_lo_store,
+	},
+	{
+		.attr = { .name = "inject_ctrl", .mode = 0600 },
+		.show = inject_ctrl_show,
+		.store = inject_ctrl_store,
+	},
+	{
+		.attr = { .name = "inject_trigger", .mode = 0200 },
+		.store = inject_trigger_store,
+	},
+	{
+		.attr = { .name = NULL },
+	},
+};
+
 static int mpc7448_l2_probe(struct faux_device *fdev)
 {
 	struct edac_device_ctl_info *edac_dev;
 
-	edac_dev = edac_device_alloc_ctl_info(0, "cpu", nr_cpu_ids, "L", 1, 2,
+	edac_dev = edac_device_alloc_ctl_info(sizeof(struct mpc7448_l2_pdata),
+					      "cpu", nr_cpu_ids, "L", 1, 2,
 					      edac_device_alloc_index());
 	if (!edac_dev)
 		return -ENOMEM;
@@ -112,6 +393,7 @@ static int mpc7448_l2_probe(struct faux_device *fdev)
 	edac_dev->ctl_name = "MPC7448_L2";
 	edac_dev->dev_name = dev_name(&fdev->dev);
 	edac_dev->edac_check = mpc7448_l2_check;
+	edac_dev->sysfs_attributes = mpc7448_l2_sysfs_attributes;
 
 	if (edac_device_add_device(edac_dev)) {
 		edac_device_free_ctl_info(edac_dev);

-- 
2.56.1

