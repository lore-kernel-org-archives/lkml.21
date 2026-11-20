Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175002;
	b=I1L5ggUptKjcvlj6kLlbt0CxzSVoH86Lor1/0LGlbrwL7LVT6SO+hDAORYi+hdlAzDc6
	 ZiWPuFJ648UVQ6Kn6PS+aLKcQx4HpOHjinc0immjUDY9EQRji/CofJbeJ87H9NEPwM8Ne
	 Nv8x+FhImsbBtlqaQ47lcQziG+4tcWdsdS1+PmC6AljxhptmDtPZVaPLEEBPFT97KYA17
	 HLGqYKSOHmxmgDgBDXInfstvwqz8RCQcUdgW6Lm2PGRz6io/8A1zaRXMdFYOcZElW5Mk5
	 mQS5fu3DXXwXFD4fjiP19/Zn6tWwljFmv+9UAbMa+HS5PBJb33Kri/jhlyXIlG5qdkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eVgtKYkwPgYU4uayGBjffLSsBvG0HKLAfvNm2HOLvA0=;
	b=e6+/Nlyp1W1xVvenPMxQ5EQVVefMKotd3hZ+wqUaP1c0nZsMFdVmiV6E1EqE/Xq612Pz
	 EG7ENTzlhHIsz/G8pHl8kjgC4XSRIKZFbSrvPc/Pz/6qFFKQa3DOD7JV6WtvYv1ZaITPv
	 xlLImkGLHcJM9rb6OWvJhQKcBnHUL4Kcz1T5/rQmGBZDujES7BccoNr9KE048MkyVDSuY
	 xaqnLpDHxpruQL4KMPG/Vv7CrzduBS1+PCvBIQ9hhQ/l5GxSmsARwEj1gof/1LsEabK1+
	 NdruVBzCeerMko3Lc3cYrRJcodqpRe4o4hogZhvhLsq2d3Xtj3RRHi/8X5E+e3LtFFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m77It3AR;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE5C606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEE5C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m77It3AR
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9d7791b00so6887875ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175001; x=1795779801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVgtKYkwPgYU4uayGBjffLSsBvG0HKLAfvNm2HOLvA0=;
        b=m77It3ARMTjZqUq6OHHALOtQGx3sLhRKjVH+4T4LeA6GJU6KfxYHZoeezT3crTOGz3
         WMYcQp4HQ1n4/6NmOuMqJjgl6tMjZSq8OZt2p4Oz/RTSe5muzguVAEV3K9ZiZXvq4BYk
         4bXui60+BjxYpJzNXvkR8TniBOE1SX7+NkKZZYfwbAlG+EsJjBfmNrhIMSJvSU1lfLeO
         S0u6E3XfNqGdxLCyIHG3VNw5xPqy3/SAPcs1XHNezg5IuBEug1VOjDGUyDDyfMxqnoZK
         8dwMC6e3X6eLC5hVy9c9q4JkFcTUAhvQixkb29zsfgsiB9SEKNemejt8YeHuUHIrKD59
         CeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175001; x=1795779801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVgtKYkwPgYU4uayGBjffLSsBvG0HKLAfvNm2HOLvA0=;
        b=LN1e6/HPoaA4gQMQbn+uf3/f9wedWvczd/UMTxO1wxWCXITfRb5aHraLCMARRRVk4H
         Z6kOnTygrdA5jhCdFSZC4qJ9QLtCM8VmrnZg98j6C69tukXu7Y8VMhzfEuDIqf7oo2uw
         apsVgKcp+YCWSFESMd6ICI9Oz6Uee0eLXrxW+/OxOspcnCn30oAEuHW8/2UiSci2f/Gs
         L+SxcrFYJzaaIapKjdQ6MW5SvBzY0KNyoT4F7hcL7RokbsRywNMMbiOncaCpFfvNUxYB
         tFSxAtC+fSxelWfDmUr5VqgNqfGwGN/32HU1kBMJQS1hUCcjWT9Brc5JCt/z40AzY8z+
         Zb2A==
X-Forwarded-Encrypted: i=1; AL+hErFG7EudZWWBfqfLTdFVArE3ehW8VjPAyIAzcJM4uNPcj7+Y8lEDUmmdWlS7mde4hHrSFkovfIMuPpf6kcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R50mQRgOA3WPFgTrpFBuH0lbh0aavwfTn+D+Ip++dspj1inbY
	wBi6zzIbab48olAfSJiPzMKk1RwA1A/x9kE873jPddd4euNdqSfo7UvAhusVsyQV+Mw=
X-Gm-Gg: AZFdTZe5ksNwZkVAObSsaABdCn7Yhs83YoBMt84hmDqy5ZtJa0ci7sw/fVfLRfUN0zW
	EqzoWNkjcnZuj4CPlrWKMThp1CagO91ZZzMVbrX3xkObPRZnw2kFOS3uafSeHqGNqshy1Cvar6x
	ehuQl92U/pG//bSp6jKeZFk1katPUrK7UEuGJ/VMt5IGkvXetyOEgEpF1bnj08M9WOFASClnmeF
	2qQk43HvYgvZ9BsA42vd8JqCZlYxEBPJVcVgXDTWZ8YnYm5dvtYEyesqxpOLM6NLd2sR8+HtpkF
	/6TCHA81EUTqtUJV4aBBZXeQpgks1pl73ndiptVFYv/SSN+8dsThi1YNOSq+a4oZc0eIccEnq9I
	GyKD0/zyX+0pquepXLz4KQijT9GxuAGzZb7ijgy8id/wy6ygnr43tixC758GXgGm0ZqVYuotIqE
	bZZhAuEtjfn0IYZmHGXi4ZERu6TLfxIWztLuKzLoQfaRZY52UMpM6KTGcjwXO8oVqYB14HgwyaK
	CUsyw0jMiZoQwyyhZnnEMhJ1VJTPX/dbgfK85TPN7bJWkwropYV8hcooHSBS2R9wwU5dEvEsv3J
	bL+eZIZe6fxvPD9oeFr6GDDHh1Kt5rsAETvg5WWedPkrwO+zaOQ60ajv1MfN7k3Yt6KF3i4bFwM
	7oS6/WN23V0NRhwlYKnorZPF0xyOkQxFaEdSN
X-Received: by 2002:a17:903:1ce:b0:2ed:d1ff:fa8a with SMTP id d9443c01a7336-2f03f147f84mr27476485ad.36.1795175001342;
        Fri, 20 Nov 2026 03:43:21 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm13072045ad.20.2026.11.20.03.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:20 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hare@suse.de,
	bvanassche@acm.org
Subject: Re: [PATCH] scsi: target: tcm_fc: reject overlapping write-data frames
Date: Fri, 20 Nov 2026 20:43:16 +0900
Message-ID: <20261120114316.3072301-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <506886f3051941899c26b3dd4d2a32a3c0cf9846.1791812937.git.yhlee@isslab.korea.ac.kr>
References: <506886f3051941899c26b3dd4d2a32a3c0cf9846.1791812937.git.yhlee@isslab.korea.ac.kr>
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

This is superseded by v2:
  https://lore.kernel.org/all/20261012153502.2435483-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
