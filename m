Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695341;
	b=rlbjAwDiUZ4XxXEfbXPo4VIfAxrctWWcanQwU3y+VYRsECRNftJwOx52wF3xEeAmVC6U
	 RRjB3qrK3cW/UNQSd1zdNPYaKAhWMvcrxzL7qLuDDIyNd+h7zmdBBQt/8cTFzhnsclYn/
	 Q6kqWKEZEvQPPngNevP2iLtYfVAlMhHZ8MfmYaCFM89VMewCInpY1HAwW/ZXJ6axIJ60g
	 V67M25TTTXNAzt/tM2xUhzlz3mKOni0Sh9zCIvO3yzxjUrMTd+GbT7d0QeICzzkzbhD+5
	 jykxXkWlMpx/WD7wRhJjcqaCpmkhoEotU3p7BKLpXIH4iyN1xVRMUE9FD8pE4FcqqiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=P1Mn4IDEtM3X0G04DoPkhdXK832QwOPLqhzhG/Y0UJQ=;
	b=zqVGVLnMSzuxMfUrc/lEP4+OZhXupH5/1iaH+UjBD8VoGMdWpGkNGqUdXsXcFnphGbUr
	 PdjSp9apfhO+YmF7ESUBZpMa5hBEHCqf+fOstiQQMv3CuzCxSnbnnQs8aHSgXjOm/FuOS
	 CdGzeRZYKEEqMlESqFv3DXqmkSF1VMXP9YmBYW3vzdr2Ql3X/MDjJWqX1pPxe0qI/M7xJ
	 RI9Rbc+Cu6e8zzZRcRGLixONiKg0KW5XNLl9z6dNnmKbEpdcPwkL4nMMtPfLG7Qhx1nlI
	 39K9LNP+C1prBwsnagvBlHbdqG2MVNzVFmWKAEJkQGDklEwiNX1cP26SWqgo7jZvCLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i7yzPMc/";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F568606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F568606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7yzPMc/
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b589050416so1203590c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695340; x=1796300140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1Mn4IDEtM3X0G04DoPkhdXK832QwOPLqhzhG/Y0UJQ=;
        b=i7yzPMc/XsUM3ABvClyDztOMuxprbiGA6nlR0sq5k3nEzw5PHnPO3+xfs+OC4MHC+K
         MS9C/O5NEtnEYahIwraEL7AlwzkJcnTfQo5NbpTexg6h54+SsHO5o+5SvLn+UBgcf2pK
         xYFuV3CZcuFiSiicAoOz6vIZ2IMx3bQFvuWwVVF3StpeduiNwvlZWzeCbJ6TQKPJXjqn
         okv9KwIgiqTggcbXpCzDxby7B6PE8++n2yS4O4polKy4OAc6bjNQuzcFuTBbBJ4AlUTn
         qs4kR5THByzA2Ur8r0m/2BupvT8H0vodv6YHK2pn7k2YtpddValLSh5eNacBd91bL6nW
         Km0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695340; x=1796300140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1Mn4IDEtM3X0G04DoPkhdXK832QwOPLqhzhG/Y0UJQ=;
        b=HMyvGtgxOZNKq4co9tTEwOGkHEgBKEXEvwK+5hOxuYMcPGmTJ/7FEUo25Qv9GMUftZ
         XZoYDr2anZOtsUSv9KKqDMWfbqdWX+kHhXklyWLMLi06ytLrbZIAyNGGxLpKFrzsds9d
         N3OHuIj/w4ZM+oFFhMGTNi/pJgx53XUeJKeETEjDdUkG9l9gwwXcmftvqom58puHO8KV
         vhDEEgiwZLsNuIb3lrbivGxFoe4b6oGLIT3Fgr1KYIraBLa0wjvgSJWqgTMVuFx+6t/o
         VfTf7WQj55sTpzSozEDBYOXxKtE4JajR/I2A7psxnYjZN847VS7BRLD9dAJd8C0gKKy7
         k22Q==
X-Forwarded-Encrypted: i=1; AL+hErEUQQmI/g8tEpPKiS+aLDMk5I9ckQj01BL60RPySYi2BoPPkfQUVHSJ7yDVDU1CUoZCX4ZTozN1QsAQDN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iE3O+uJcOoQee2XS5VTz1RQkiuhqll4Qa3m4rXTqaVHivI87U
	XqlUpLV2TdwZIckj/pJXVXJBtUJeyknaRz53fIzFVqRq/WL1KTN/XIpr
X-Gm-Gg: AZFdTZdU6NKGXHy9UUAscCQ6ctXBOmMmNG6paVJzJoIbzCqI9lwar27bnl5y7VW77g4
	VBfJYlsVSozFLd4SG5ifL0iQ2zxTtcDjfEf9fAAMEOaFH0BUuKm4qq7MTsrCJuFww/8zyy3djWH
	qKOtkMV1l522S7QWRNvGj7GSv3Exvc3JSZd7DMZs1Ja2Grd52ebyDiHN+YccaMrZJdsnNquX/ta
	Zs1eKLxby+7Ihzm9aka5Bb9pv8xdntZRYaV0huf7VF+LVmIMcmm7hr8osZ+pR/omABTWclcJfxO
	OZ7jiDgvZVK3K5n8B+Ywmp/BhC7C15ydx+ksMN3UIvJeb/iL4OslFJ3H8eVH6NcsxRvqb/+a7Rt
	iCj0PoGxZHEg+anDnLEOWV5gv8e1DujFpuxQhErDpb46wX4IVmlWGNxRpiQphdMe6n60E6IZ6qP
	YctKh0If9OjjLnoiN0Fwr6NZczJDR/ciVTkRjy0Sg6F6lpS2q9ho7lFJJa7LOPzIpYguTCpG5yT
	cxNbZ8QnsoUJR+aZQPYDcoJD6O3l90ehjuduP8PTzcGAmu3HFWwYdYsaJpdZ2GnPaYtjIrMP0E2
	wOarG/6hflaiFptfsaUc7fK7W52dfw8N4tCM/dMxRGg2updv9IgVmXDAdVr7hC7m6JIR5jz65p1
	naBastInyxrbWEPM=
X-Received: by 2002:a05:7022:b051:20b0:185:b157:f271 with SMTP id a92af1059eb24-1b5568e30b9mr23372593c88.23.1795695339724;
        Thu, 26 Nov 2026 04:15:39 -0800 (PST)
Received: from [192.168.151.216] (115-179-187-167.aichi.fdn.vectant.ne.jp. [115.179.187.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm58188566c88.5.2026.11.26.04.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:15:39 -0800 (PST)
Message-ID: <de7f36b9-1ea5-4f48-91f5-dda0146d2e1f@gmail.com>
Date: Thu, 26 Nov 2026 21:15:37 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Vladimir Murzin <vladimir.murzin@arm.com>, Brad Hawthorne <brad@sim.vu>,
 Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
 <20261122003911.1203777-1-brad@sim.vu>
 <b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com>
Content-Language: en-US
From: Yoshifumi SHU <envzhu@gmail.com>
In-Reply-To: <b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/11/26 18:48, Vladimir Murzin wrote:
> Can you or Yoshifumi send a revert for c5e0cbe2858d,  please? I admit
> I overlooked that base already at offset 0x100 so I'd be more than happy
> with revert.

Thanks! I'll send the revert.

Best regards,
Yoshifumi SHU
