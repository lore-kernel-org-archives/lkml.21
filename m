Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174464;
	b=RVMpbP49vahGjpbqEBoPjV8tmBhOW0Tfb11jULMS06xEB20SJ4PILi7mCk1KXEBkypAL
	 BnUdYRkaCnCDhpkY+p27ASVhdu8S+JYoKx2qfy1JV6WPolKby2D/igEkprbg76kJEGdnq
	 Wz9q9dpFIUrflCGuNvG5e70T+YRHpwxB4YNtXFOUn4UpRGs5L5arr8n923+BRq63XeL1o
	 n6pA1lqkcbG59/zl+Yj3JZsTMD8HxL640FGdaDYT9pnoGrZPT/Mg85z1/PWm9QlVzPw76
	 G11Lat4xZoY1qxhZCJxC31lFWIEqGc5kP4P135FzTPfZL+9qD1dVcfioeF9IHk42S5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=vEsBdIWYabc7armrphqdHdgCZC5n+spFJZgoOjwFkLlBJnh4sjikWDczPfBf5U70Xd1J
	 hAj3q0zHcYTrrpBPDiJ0m48W7F7/tyV+v8tjwlTBVjRN847lPeYcxqTSBJqpOITvuPN87
	 Agc/2dUav3Xrkkd5u9KuVM2eamkwkcJAKLZDdcjBgQ+v02IhZDMkHsJE+guaizmTqmhck
	 oYUPmejFVNEOsFmZK1H/vJ0FFp2LaEEm6Y+/sLXTYqeDmxf7zWaCbWysS5t9LPPc0Sudt
	 0UBSTxBul53NOHAaLl89zV6hiIviGshCcL+/qTSPK2smmRu82tbmdjmwsZSQzYPhdKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ib0TCad1;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA30606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA30606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ib0TCad1
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so404129a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174463; x=1795779263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=Ib0TCad1F95Ie+xma1sMys7I7UCPQQc4SOoNtHTOow9PYPTRSZfxhOEqcMd4S3UPpB
         xOIhzinkpw2Uq9t7KO1a7+CaKP42943VIelv2oiikPJnJ3n/Z85DYMgS0T79LBkB/QjX
         ZRYReuSsBgxh7i3dWCat3I9kVDijlloz+UfTOwKz1wNsh9Bq6U3vw0pppR0RuH+y82hc
         qrG0JnrTDkjodnqFTcSv3H52DCKO8NwdJOkfx5xNQwfrG1w8k6AG4Pxxjxe2bjVcXfpr
         MyDBylv/ON/eHQlmZuDyBrVbBmCLVzvCTJ5SIs+ZpUpEanFlyi+od+4/CcKARe2mtAVC
         sFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174463; x=1795779263;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=vJ7oOo4TDez7ifQlmB2oZfXcs50cc8bfU+0RO/PT9HqBAbXMehJtzeRxeT4YVSpPSM
         PWvao9rLoDH8TZqOsdNuRQ7iPBRkIJFKnAJHXDYVhkuOPPbs8AWfsLQUBLZLXsytrAD8
         qCYoxfXPxS9cArbnLjcvoCN/d3hHxiER05h1g3E7zVN7p50kl+qn6d4aiqZjWmlxrMr+
         BehQnTk5CQNWCTFBJT0tKDfT+7CAbOIlOr1Nx28s0zaDWVASOvN4scjZzFYhXWCa/Ojs
         Krs26n3jlYoNaU6y/nYRmoSzw2GmaeNSA8zCd8vt28vqTKu5ivndZAAj2rKGNE2iaOLq
         p79A==
X-Forwarded-Encrypted: i=1; AL+hErE65jOYOcYwwVfhCneIdwGiFhUxmwbbPgKjHShHN7NNXlEQL/IAO1KCpBIntaqQx0vsruNlrYYL9YoP4cc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D7TkOKfPUk7Oi6qJ3P/rnxkEWs9n69XM0fX61UY+j2u9bh42A
	R0585O7O95l47Efi4jeMc2uSg6/jxHzZ45eLP7Kg+Zmy1FU39rdfbiStBh3MOq5itTvMuqvUdet
	slxtb
X-Gm-Gg: AZFdTZcKQcpXhpvrFYkmiPHoQ6Il2eO3dycLN6NyEaVOCuzjBMEnkYD5POvnuQMvoCC
	xamjj0zhJz5gxlagpBzcozXyjaM6jf61WuDqKiV4V1M/ykHyGDSY0tbH92oxqeOxf4rV+p0uCjJ
	ja0H4YVuVk5bKei1B6eZPK8b8Sbj/Bjow8dn1f/+SkGSxK4nW/CBiyRic51DcZtalftukz+AAwY
	nMalXCIq/ROx9EfStrWtIlhOZxDXgOkQQeDGs0x5kVZPF6NhGIomh8gQOAJ5digaVTsE8228Khy
	gLb15+Gauv3nuY0yp6cRdgTJIRJjEnKYumMT/Lai0OuiyjSv/Lb5R3+XR2LVbGA/IDWzEx4+Pq6
	dQMSXNns65xbl+DC28KxM+++5QejOd/vnQ8PXIFA9jFnQOHX4HQkvkz+l1w76eozIMs9UH6YKX4
	IZT4mLit0RgkfIFKtEXasZIsiuW7qV34SaectqS9SpQXO3WKhRqQESO4jdsw73/2go6Y8D3JKeH
	VVNRZH1YItK3gcVmIC/c3U0ZDiJSwE6T+CMQc/n/LaD0POYAFtPZC44DWXTO5TZDCDfFIbtra5l
	1lImoNFiHinCDJOx1TcoEGUL0E1GKu4j1vG2CCjR0Y/acr2LvYPiKjBRoEyEiZPM4DsY+VhMedw
	VetTiYwW3BpfZaBbODjLNEaMUwk1IQTRbZC67
X-Received: by 2002:a17:90b:17cd:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b41c9032bfmr2325880a91.26.1795174463114;
        Fri, 20 Nov 2026 03:34:23 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm4117971a91.10.2026.11.20.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:34:22 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Fri, 20 Nov 2026 20:34:17 +0900
Message-ID: <20261120113417.3069190-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
References: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
