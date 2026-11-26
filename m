Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675162;
	b=Aek5fERYP3vdJmkKRFKTMNSrIoU9gf4lfmEf3pLYw0MybJpFYB3Jm4XvoKxoOKq0jPLQ
	 h9iG1NAmJa05G+CmDYVXlp6QjZ2qCWTmTNOI16K+hHt7iDo1hnDJE2ZE3xxo1OGcF0FWX
	 c57ZbV+s916bRN4Qh9kYiPftVPk5duSc983yEyIW/7KNrKht2ku4TjRHY9zlhfQpFUsSD
	 YmSMB9Hmi2YxmysHEUUk3hM1YJ9+cjevgwENVOP8IPQW0J0x3rZRsTB1zmrDmB1hVa3h0
	 krHihKRht32COLi3a/cBGxB77IKu0BPIfxwKamgmrRKTgjzjgh+u5vPeLPSdzOPsD5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mX7cQaJdQ3Z8GzuWZM+Tv7znYIvTndE2qCggNaFUZmE=;
	b=MGqI1ho2zdDEgVlMmYMDcMpOrJrrUK7HCP+GeNzXfUz3vLrIoSFbEtWsyQpSpTPC7RHm
	 vXIovdNHf0V6UeEU51aOezC8d0wmCx+ejJ9pzZNDZv4bov3hHACCUnIJ9SAvYeL8qFWjf
	 3eb7IrlpH7tHBwcJXOfodo/Cq/10s9lcEBF2p2Kiyy4O+tI0z2HT90ijNl1e76+43ZnCu
	 lk1P7XwPj/AdDv2Aahung6bE3wAu/9yfj+Ha2yq5m3gtCvV4ovqMiUyL5jUd2157CNS96
	 2d9EwPFjbwXnWIBO1Zx2VYW3IpgRzir/2LKC00XBg4+kzQgCCVwbT8YYCRjO3kOf3rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLvUAliF;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EEE606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EEE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLvUAliF
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so3365572b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675161; x=1796279961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mX7cQaJdQ3Z8GzuWZM+Tv7znYIvTndE2qCggNaFUZmE=;
        b=kLvUAliFJyEB9GuFnigyENCAPMqPACSl3yQ0Lh/p5I9xtKEwSoHuqvTV4Rdh4TyVqE
         DgixpVSquD4bQNYtr9i57AZaqGNYOq9vh/q218XIwgn/9El12qG0twmL1SrPp7n74i+D
         rZLfsl59GbRoGUaBOvnMbvLLmO8TwA4jIC4ffJqDTJr6L+SjFmGKGxsVVh6XfxDzH1X6
         tQsB3bo3JA9kbaYfwffzxdhEHgLaxRo8hjdUBHcJbqAaZFyNF8Itc4Itzn8lpWAWYUK2
         vjr9NQcW/YnV8yESkHrutrXQXFx0e1ZqL9LQ8JgSyjMs+ABOPSrIxPx2scm48JqK3CMa
         jOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675161; x=1796279961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mX7cQaJdQ3Z8GzuWZM+Tv7znYIvTndE2qCggNaFUZmE=;
        b=jv0gIh4EobcP7u160j+5UjWahDrmsfxYYN6KUyRYIeQRHdpGXWEqGgnb2lZRmjUkvH
         /bwIHow0OGuf0cEs2wbT0GAmT0Z2g1nDLWSQLfQ3GpVqXhwlS3Nfa58YjKIHTf0oxhJg
         C4YlsGaic8z8R5msma3vbRWBL27g2gJJovrWYgpukFhu/R6WQLLjc40A3M01x2nYi4um
         TSHbn9dS/tB7JUVztEHMttDm+d/pNEe/Wu7erq5hW1Aj/hPe2DXt2/s241JKYDxSQmi/
         fPkCUr/ekdMH3X0l9YrWk+X/gwb2khx3PtddmBkytrOdTyAXnDWoLV++4UeiihZqjZmG
         5ayw==
X-Forwarded-Encrypted: i=1; AL+hErFNzvY/NSFWXhRzL42XGZips7Tt0fW84dSJ5/DAQYU7CPDmSmjTGRHJQexTGsQEcPw95qRLfoRDw2wyvGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eWXZ5EMIa9LFxyRdHEeldLux4oXMV66pZAuufkIE8Dp/acc29
	w0Th1y3Yplx2CUh3UxJ5xlZCfAAKL3FVe0Lo+NUIQqksYgkthAhIXJTp
X-Gm-Gg: AZFdTZeKQBuHpteoqcgqoSKKQpwa1E2HrOCgyS358tUFqSVsKZwiSGXwniFsJB8yqyb
	9EyG5GFuZujd3j00Lcfe76hFC7O+RtwxXresh+j6Txv2iSjJX3vGqTk8NMgesURpgMoewdbRUn3
	cWbGYbeIjFqhcvPI3FQXT4hOSaSoBBo4+zb2DdAT15rydiVIRz3+VdcoEhMqyhpCR7QbCeFQ5I4
	ZIAo3KGEwBpCLCigLiY6qsC48wgprF8AtpykQJ73/IeRaVv1b3pdpB1k6rApFOFiKQuK7PxemEn
	ed4tqW2RRx4d8Jpi+dPQkL2tw1xzI5I7ndoyzBAUDhD5/0gC7z7NPLc3VLlAxxggo9rOPivYUOf
	wB50ScYGMPfKgCtx6p3ocX2s7dBGovE/TpxSJcY0agrOCI0rL7QBV7kDKRXuBRGXnf+Ce6rKQQ9
	nadVtsJHr6eIkpNhW54HaJgPPlfCKjZtRd/stsSTZQ563TT3B8mEXRhJ+wkqA7p5mCA40Q74+cv
	U5A5a3hxWMkzER7bh1AVkvTN02ImPZgjm6DNL/NePF3oLAsm5AO6zrzMYQpxbRPgxj6aLhA6EKP
	zPRHnd6ti4BShyPm8fIEBNfvkCaen9cdzkaenPABx/7ztU7dBqrNrdI=
X-Received: by 2002:a05:6a00:1802:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8c87c389ae0mr18623299b3a.27.1795675161015;
        Wed, 25 Nov 2026 22:39:21 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm10297575b3a.8.2026.11.25.22.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:39:20 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: cyan@meta.com
Cc: leeonion.muyu@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v2 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 14:39:14 +0800
Message-Id: <20261126063914.3237108-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
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

Thanks a lot for testing across three lz4 versions, Yann -
especially 1.11.1, which I hadn't covered locally.

Ping
