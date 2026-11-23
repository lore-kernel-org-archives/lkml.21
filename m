Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439940;
	b=1c8PCqIpdCYDha+Z6EXhfWEa+0zdMgsjt0IBExs+eyMj2B1RkvshFhDFAM++QrTl8zoL
	 asLogpkfTcrFPsnwJoBhV7c8jqB7Cou0uDOB8D650t4I36pmpYF86wGV1tQhZYQXZakhh
	 EpOauSQN53nLquhYB1gGl3Vv7afPNdZWm2j3BgtIrQUBCjOEh3o5xw/Q0F1emESaZM7b4
	 GWtNoQ+3EFPjjlBP9xUgl0RkVndDUHFnis9q91M8blnZhnXkcSPDlYNMTA/OS05qrlslx
	 oUSs2Q8iIadEDo7wu5Nr3LhjAX+UkJc2VCrU7urs65SUxt82ZjQ4GjUf8UU6mWO2opQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=D66cqDWQFzq72guLJs/T46gqCGetTmFwVdcYSyqrn4U=;
	b=IqbQHC7OWqa2T0w1PChncbIdLA7F4qZ+uT5BtMeOdNihAAJsFWVLcMU19waTuqgMAuIs
	 48ahdo5p6zPqYjyQ6G3ceDZyhVwYct30JC+WybslAol+H9jrQcxkZCxyynmZPv/L+5cpS
	 RF21EOdSmL2/HE8kLwYOgukma1EbprEd5iGpJ6SRBdCCpNtncLG2Q1V1fJQaLBr8U1p4K
	 ctqEIv8fzbtcnLnIClX5lgn4lROAhaIdd9ZfhwR/Py+y5cfAghc2uU/L1orkQf8wnN+Yp
	 l/79Dy0FEAuXcpRQ1O/QiufhKgtLUa+giesGWY67A6MlP1JybY6HQffrQHGeEOGcXJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OggmVO3O;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2576606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2576606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OggmVO3O
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso38024105e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439938; x=1796044738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D66cqDWQFzq72guLJs/T46gqCGetTmFwVdcYSyqrn4U=;
        b=OggmVO3OHG5vwXsX2xjm6qyj23of0DdkdRwKumy+CxnzyvrM2hT2s+mg/zGERa9t1D
         8BNC6zSvAFPAy/TaZGOaE56gm2PVsHd4vKzrm9sHb2x+uUxolBsVCouETgQkl/0/IsPg
         +2YVPSzbSVLoSb15WW518geXsUO12T8arKs0EKB96knH44Z+tuvq6mLpM+GgJFRcmofq
         6OCGi+ut3+83Bb776ie2Ot2Tk44LjvUVX7vf17I7oMfYXDwIXwCnhE0qh+3Pq+IY6r7y
         2iVpXcndODz5SV0PvSbcCIJRW+YjadSwNCu2itA9j6eaQn+VCg6tf+5QkfzOJORbG+P2
         32Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439938; x=1796044738;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D66cqDWQFzq72guLJs/T46gqCGetTmFwVdcYSyqrn4U=;
        b=xRR/xYrw+8jq8iZ8XDD+ygIMLrbN7UMn8hJWsX/k2UKBxW8oUho9sSB5f6YneL+mHN
         7xVftqnBdjE0jllM6qlBQGbKvkb1TTVFLwlNivdNrOydiw1vHqlu5gsdi62kyJqoUi5A
         z8G+05n7TxkP8wKsiBYC5grb8LZX7FtcOJWnbVUn/7EosnOLMTClmXUWRtMr/GNvV61F
         jRR6JzPbpyRTU3EGFEYoNCH/coGEjVuGsHnnztxhQoFzWfeEbfHvTu2mS8BVp8CMR75+
         7M1Aacwguvg0TxI3JI4/UrKN2gFfFWC4FRyDvJiuM9+2Wz0rzNkF1pIlBn77A3iCg+Db
         nZ0Q==
X-Forwarded-Encrypted: i=1; AL+hErGmYYEIJpTUJDUDNGQcEw14egljjVgkOjaYdafZcPmdS7d18XEr1JC1aPAy1tf9+SQLnAEXlFilmE/CJR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oqf0uEfx4IDgSXMCe3CcJnkqwZZ62vG3AOclPufHhs/BX8mM5
	GOnuWX6NxvZdNX8GDHCAmR5gm3wLNuLQ7F9NXLQ10HJzq1baUVUAxxro
X-Gm-Gg: AZFdTZexivVOnLpmX0xLT7BzvU8LQXTeeT9MGZ7C72PkLEVWr6uf3Z31DBjY3yhJifQ
	OQa96OWJ1Mu5nXFnozdu2DruJ7SfD0C+ndQvQmR/CX0PK6LKdY1B3cpdgAGpe/EHuNEhAPSn+tC
	buzD3zGCwNkDsmS0zxmUmYB7oWqpnELuRFv31/T3fadiAOShavL9jszgJYrBNISLWGRqfFM61oo
	YqN8177PoSdvj67/gWcETrHonNtuBotwBxWfVX069JhtGgKJbBO170pWVeg7wLne/fYeEQAM0xY
	5V2nbT+Rp3JeTxGkvj/9fGg/DHRCeFby0T78yMFk9Na1B/q9Ep+v4cF05JlIJ6U8BTQy25rFHC6
	IumvYzRbFO1zDMU04fCq7BNpfxONVDk750uHg//NALADao56j3WQFcrMDImUKPYYrDw6bI9z4QO
	x7XIluCrSVopaoXL/g3quUD+U9vtFVJarkJ+6AIfopMhAp7sVy8342cA9qZaDi2s+7V3+HbOmUQ
	QneOmxzhdg5EDWi6fJ2A5h8uqrZQJ4i/dtUj0Fw5RUBbgHRf/br6COmf+VkxVRYxKxUGd/Ugu/l
	HEqwbjgp46IziMtFksELnxtsSQ==
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr244307385e9.1.1795439938049;
        Mon, 23 Nov 2026 05:18:58 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm184923665e9.1.2026.11.23.05.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:18:57 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	chang.seok.bae@intel.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH] x86/fpu: hold fpregs_lock() across fpstate_reset() in fpu_flush_thread()
Date: Mon, 23 Nov 2026 16:17:59 +0300
Message-ID: <20261123131836.220685-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fpstate_reset() updates the fpstate pointer before resetting its size
and feature metadata without holding fpregs_lock(). If the task is
preempted during this transition, switch_fpu_prepare() can save the FPU
registers using the stale feature configuration into the newly selected,
smaller buffer, potentially causing an out-of-bounds write into the
embedded fpstate buffer.

Hold fpregs_lock() across fpstate_reset() to prevent a context switch
or softirq from accessing the partially updated FPU state.

Closes: https://syzkaller.appspot.com/bug?extid=58cbd7974a103b8b8916
Fixes: e61d6310a0f8 ("x86/fpu: Reset permission and fpstate on exec()")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 arch/x86/kernel/fpu/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd57f5e..939f800373a9 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -866,7 +866,9 @@ void fpu__clear_user_states(struct fpu *fpu)
 
 void fpu_flush_thread(void)
 {
+	fpregs_lock();
 	fpstate_reset(x86_task_fpu(current));
+	fpregs_unlock();
 	fpu_reset_fpstate_regs();
 }
 /*
-- 
2.56.0

