Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142535;
	b=GdpJJ/02kdkBp/brgfKFr3PcmyFp9Xs6Sg+Kc4ZaY1yuMuB5eRFI+6rI/kVZ0n8iUhs3
	 VhPEkZ2IiNwJFFz3depeiE26Z/L+LyNWT3+I0RYMMOtZlw90esF+6UQqY/dDSthEzTDM/
	 LBmV2vNBig5UDH1txGK7x2DMZ/55kRtWl5pEpPVAt+jmbBIPRRH+85UIMdVItE7/G1zPc
	 Y9f3oZgiI5tzoyPryJwGZa7iE/UQNKLLnIK79b7yUNBlAL3tUj/wagl5WfsJt5mxh2Gj1
	 AEA6v2ajxRvIJw3e0BC/xywQIPiIIYkRUiTI9Z3Mrwu3YZXim8WOU6sM3+BYjlStZgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Nzf7HyGQGJipLzRsxdSMLabv2rUKwLHQTs0uFyn5jw=;
	b=vtwW9YKnuOMmafuJuMH9MOjFHFCfZZ84qpFyNcAiZ8ttUlvXJ7tQp943NbP0UiBYUwGJ
	 iVDQ3RAsSk18sRjE97kbW7iLvIh3tBIPAGLcnHGwzVJOOGThUcfcJZvek6nuS0xTjBf5D
	 k9Ds3TpYiwmXRx1ZvYzNF6bzArhMeVbpmH1a1XoJCSjG4oIUGLFj94MwIs0mBiwNyxi18
	 pqE3wJSds5G/xS9cyLUm1Tr+iWBpAbz/ifOoLmpVI0yCU3M7ARK8BRaa7hDZbq1TTt6MP
	 3Y1vkwLWw49o5mRV7iOh7Aw904IS2JKp4oBFvf8y8spjA+D3Q3iRnT+k2HIPmjhsBvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bXPNDgqL;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2376606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2376606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bXPNDgqL
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9497a167a6aso193877685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795142534; x=1795747334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Nzf7HyGQGJipLzRsxdSMLabv2rUKwLHQTs0uFyn5jw=;
        b=bXPNDgqLxbO/tF3rTtsO6QiFUZR7W0vFYa4Mk+BGo8StesXmgg8noXBCJxY78vFQ/v
         ix1a1hbs34KImrRXWUdG0jXAsUJmZSooEz5YwigedjWOA21z24p3XGYB+6arb7+G+efi
         xBFXSUgB0OAaM3rTuxPEA8fXva5Ort/+7+amt8DNT8I+QA6XRLNQ35HWe3Mq+Msov7Hi
         zhY0eBxvaZGY8LhOX4rUQ1TV/wFsPz7dVhCHCtQ4/f74zIJinNeWkpSgFQkezb479OUq
         Iu4tcvXwnbZ8R5sA+anV0lrKW93s6j36EfX42yWnCyBi5dYsCRe7Cfrq4UjPOv1QwcLt
         ttnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142534; x=1795747334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Nzf7HyGQGJipLzRsxdSMLabv2rUKwLHQTs0uFyn5jw=;
        b=k619rSziQNDJ0haz1/isZu/gn6O2ddG/tEA65w8yRneQoZfRGBqJakmziMf56C2afA
         mZwZe7S81cTVCzqJ/dC5zIcNaPoMqHU2K5lKjdL6ySljVft8N08l1+arCnRfLIyesZZ0
         qCbhICT+fs26maj2KbqCyuUyY0ZZP1xL/fHui5QVKJHtIjh2OxQR6YhDfa9nQ9EwDlBW
         O6ED+jWEBoiGQbN/bB5pyXk3FA1P6M2sTZzd2d7PEZaPo1zDsU7OCbsD8SxA6uWkKNRK
         1THBGmr24aioVpMmWDjbI0Pk/u19eW1vGeCkmW8t98PpINbYTlEap7hwSfK+bcZZsfRn
         Nhlg==
X-Forwarded-Encrypted: i=1; AL+hErHeq2551GdQJJjM2Tmp/gB1BsEK96Yjd0BpA85DFamT8N67ntasCvEnwXbAlUdhtmeuxwIDlwx8dQjmykc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wlwsasaIYGrwtC0SErpKat9epH9gwtSe9kAqGwich8zhiD2aV
	r8F0aYTSc66CK9KFqhSU/dadXcumP+dA1Fi9s76i9N+lwobear4R3zg5
X-Gm-Gg: AYBFou1z1MUdGoZsSh0EHQnAC8O65v1pAGftlqHGVWM0MQVLVo0HP0FNf6iLNZCnEFN
	mBjQFvtq2pryPmz0UPhz0sy6ww0gfuPb4/ya1DLUsYUMlxyON1pmMXa2kbEWk7667HrCca++H+l
	QYtcUk8/wOkK1AKm9ipLX1cIi/bjjvmTvbRJmKhp5LzhiI9v+5k3ZZ727K9iGPO/nQBIGlfGGMg
	3HIKCnKeE8UBCASz6HkhdCd00NEP2BOuAXNg2br+IiOZjEn20LRj3ahDQYB1IbrEQmKvgMqqnQx
	mX2VI51zV3FR2ty+/DlAuCnBv/2iUGXRr7pvK2bfkBhR4FmNejmrocmrLOLDV2BRVvMubgHKsJ/
	de9C1df06KBiBCB+x8FjyfDvNjAPWDpOQao77sc75pwrnulTePFbeKa7U7YFMqK7UbqKDMWo8Jn
	zPGa0BT9zXlBkX7hVb1vyVSdlA6LUaIspyEWRR4gp0OdfIDp/kYqkA5I5mVCmY5eLqJOe52b+9s
	fWtMc9vIw36V303ES/s5iMt5H+IDXU/wB5XYpzLsU7arHGKWQy5+jZH21DNkNwjGsBBcdILiTYI
	EXVpULIvYbXQuxrw9TdsAGsuajjccpeTABgh0iYvRSjFkXAusHGczhqeV2MKVIE/E2mwQMFLnO4
	=
X-Received: by 2002:a05:620a:2852:b0:949:8014:70e1 with SMTP id af79cd13be357-949ba95ad91mr277788285a.6.1795142533878;
        Thu, 19 Nov 2026 18:42:13 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031617sm100514785a.1.2026.11.19.18.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:42:13 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/i915/gem: Set the VM owner before publishing the VM
Date: Thu, 19 Nov 2026 21:42:10 -0500
Message-ID: <20261120024210.1658348-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

i915_gem_vm_create_ioctl() adds the VM to the file's VM table before
setting its owner (vm.fpriv). A concurrent lookup can therefore see
the VM without an owner and allocate page tables that are missing
from the client's memory accounting. Concurrent VM destruction can
also free the VM before the owner assignment, causing a write to
freed memory.

Set the owner before inserting the VM into the table with xa_alloc().
If xa_alloc() fails, err_put still releases the VM.

Fixes: ca02a0119f81 ("drm/i915: Record which client owns a VM")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig and W=1.

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6..489b221091d1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1838,6 +1838,8 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 			goto err_put;
 	}
 
+	ppgtt->vm.fpriv = file_priv;
+
 	err = xa_alloc(&file_priv->vm_xa, &id, &ppgtt->vm,
 		       xa_limit_32b, GFP_KERNEL);
 	if (err)
@@ -1845,7 +1847,6 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
 	args->vm_id = id;
-	ppgtt->vm.fpriv = file_priv;
 	return 0;
 
 err_put:

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

