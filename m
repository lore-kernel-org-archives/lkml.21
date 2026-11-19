Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116359;
	b=GzQWGP9aHcBY7bIvG1kLOFtt3dQct2mMON7f+UeaOi2Ou06oYMFX5bjqGKe+jQolUpOZ
	 NIiJR4WUZRVaWNnowsATT1Mev4d4qaHGfFgolaam4wJZn0NzyfyN8gHJR3aKxoWShGIPc
	 cyw6GfIRPfqX/yooROCGJomGF3DelR28kJ9++1tGq0p0rCw1y8BD0GVvSfZSECUY8uXZg
	 Esz5/1joFYrf9qSf5aKgCCubElzz3WxnFDUH+LtjTWWfOGnbJZRDkBc+HfHe3DMLvSr0k
	 3TxJeauhWO6aliy0ig8iB/8SrM9aNZxTSgH0R5jDl6dEc4qH8r08PFix2NVdT6OYOWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
	b=bzJLiAM77SVQtiinUyMx0qY/O0k4ZlSUWIaZeku6DHCwLAS7ysy2vJy1c7zFq5cPCf3c
	 RTRrgt6t4MHuVtg4S8gBO4vuUdcysoX7Ds3acFAdaeABLlFgBjrVnlsC0fJiq48ulD3cy
	 WYf8UaO8dhLgkpESrtD9f80S3rzQx7pB6Q1Np3ArqsOyQ9IEl4npyi3DXd1mPF3IUxY2W
	 t2xsH+9SRjT1WRE8O9p9WRYpTCTN6crz9rRYRdXbMGfCSh0WHStIdAQRlzASC8ULokjBE
	 qymS7gipx8pBYcSyAWkOxfI5p/lWv+ibe7DkLRdtXVw/JQuzyM4q6yF3K+cwvOwtfZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D+q8GpbI;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825B660A261C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 825B660A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D+q8GpbI
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so65142a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116359; x=1795721159; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=D+q8GpbI4NdO7QuDoNEZVES5pOHQO240I7HDWjn1f2rrdZCPcnuN3whOXGpx0a39oF
         vy29NgI8yDcoBcybaw2tN63zB7751vVbEVZZn/LzCMjY9HBRS20Keo1KE3hlO33zrKMY
         i9rsNYFToAMc7x/wdPBJ/4VyeJTA7enjCxjXgL3JsrE7hQmAx+Yowi3dVHZ+q9R9WTsa
         Q51KrqNHmyCaoJot9RTu5s/hbSfngwHvYv+jm5vhy3LwOlq0rIMZBhXUMFuk5WVGWCJ5
         g7VSQ0AS6OPJKeceOFnEmsage9ERncv5M09VAiTQMd1EpN6QJylgkCyMQrC/nJS7o9QN
         QLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116359; x=1795721159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=z2RxrZZiiINkmmvQs9eCv+pTE96KdGaDmBBE+abr4UDCwTpkC9ZKvAY2yx3t3IpKGR
         nA6I2TeQ7VUF+mvS2RdYucjDUwFxpnUxrRMNUzaMMhloZCdAJe7NZpQ21lvmyBfYXzHK
         XrGCS7zHP5EBtORHAuWtgGTHlgLlMnPc0HlWhWAE4vCprd5/wTXRaVp25JD21/yC9Gq4
         cPUKmhKjbqg+nK/GR5IKRty5m4o8E0AO0pxtXkrzoqVx2N6xyQjeCes1wKgiqqfgCiIy
         4k4DLZmr/51wuTm0c6/KyNH+OYN+jXX1070dXLa91+R+N4nXxo8N4dwO+7JNfXJoicT7
         9n2A==
X-Forwarded-Encrypted: i=1; AL+hErGadBk4BgmpWh0SxP9+QTLjRxw7tVx47+v+uwgsktfxGfnkDgUPKxM+fQ8h+I1coabPJeHO4K+7IuPhTjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P9msrV7tKy+qaVK0F3abYCNrGL/J0YUj6s4XX3szxRMICvwrF
	y9+99fPD6nQG4m1K60Ots3VU0PTfrK79Jn41y7oW91nrhH1eqgjvNUWApSy1Tko9CFdM/mKL91k
	BUwLtSipXoA==
X-Received: from pgjk11-n2.prod.google.com ([2002:a05:6a02:81cb:20b0:cd6:1fc4:6199])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9191:b0:3fb:1bfb:ff29
 with SMTP id adf61e73a8af0-4014e74d624mr589862637.69.1795116358583; Thu, 19
 Nov 2026 11:25:58 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:17 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-7-irogers@google.com>
Subject: [PATCH v4 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/xen/sys-hypervisor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index 91923242a5ae..0e8a2cd69fd6 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops = {
 	.store = hyp_sysfs_store,
 };
 
+static void hyp_sysfs_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type hyp_sysfs_kobj_type = {
+	.release = hyp_sysfs_release,
 	.sysfs_ops = &hyp_sysfs_ops,
 };
 
-- 
2.56.1.708.g77570a6a1d-goog

