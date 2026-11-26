Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706831;
	b=p3AiC0JkrihbORE4lleHkj4isQCt1lTc0ndPI1aFqw/VVIJVtyDnzu79z9MWfUVvPyFc
	 wDQ0nRVk9WOdscwvcxUFzNeQn1ejgbYoPr2Ng24uoS3falkA1XwVGk1+cKayvjIvGljyz
	 jnTR5QrOCNDTN6l1kGqHXVTf0jqanzWHtR34NJ2gJHbeo6NzK7Mp8hppmq/g5u9nBSjDg
	 GWiaeNBUDQ9zNJ3VzmFHc6eK3+EpFfzHumCbSPp1OgLKZZphl2aSmd2m+MagN1K03RKJF
	 1mB7ya3n8DHh580z+pwL97EVW52hmYuTKpRybxKZjJxQ686uOz62CCOZw1gIgv5DpXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
	b=oSQc8NBNkp3BkVThgDNWKRRZxB9y1QF6cAm3Owg/EIN3eXspvX18QyaKjlDKzbJErsQY
	 6otfPHFoajETdiyKZn6ZYegudFe7ZZUilIXCi1MJtv8+HscpNRU1+rQx6EFwkPMKcgvxg
	 tqb0Af3E5xTES+akR/eP2NnQZYKzjPutSfczviUsWeWVZKRz/S7kqwz9vJ/8YlQl9djGc
	 Zcm4AY0kwZwRAsxvHozBpeD4PdiJNeAPpfT1GOElMegc/FLgLyFVLE5RVi3ewt389V5rd
	 7NObW8X7v+3CYliuIAFa/JnJXEg1P6Rt7i2fnumvNq0JYp7KFm7KqdqfFhgdjnf+sqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u3APBei;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79603606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79603606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u3APBei
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso51148845e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706830; x=1796311630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
        b=0u3APBeidcNd11Z2j3eXaAjA285OdvSXjJLehh5NHWt6xAxNEA+yxFk808nOV+lKxR
         wTz606h7VsjqgUh2yQ2oWJcCsrw9JMQQ7crRF5Beymr4N8ogKAjE2jfXFSCoHbC2+huc
         0TRrGnBl31IEIZ0O+V5vXWR8MHHJqERUOTHM5JOIPw16TYDG0KjM0O8Ci2Jxtx2eYFg9
         tssnkzzAwh/U09Y2BX56vJHGAsq/K0O6o6w4zvtx6rphXDNkjMpaFNA3An7vClLbUpqK
         L4T+dpMPxI92wNYPPn9Rv6FP50M5UE/uFl9AP5Udx72kK+1lTdJXmYOKUDB8DTOconFR
         R2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706830; x=1796311630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
        b=TZR2OmZG5X4oUc/va1NfGMwfUYLbtDM44UuvkcVdmmM5ve7pH7M6wrfgTOVNZE4u+z
         oVe6gJj5hNYqLycCM/+XlmjXvZFwCLdCkuJabiP/00zxl3Ye04T1gorwYgDSvDJNcUSW
         vxEF97yjcaRsU5cWdLhmafW0E8TUapq7JJO0WNXdbn5knW9S+0ks95RMGIb7meVbikXH
         KOAzOI3rSLiwtZZoTy7gJBh7VMjgji4hcqoUqvbK93JOPW8AVkqI3aQTo8xlR2vYJbc2
         HMms9Dows/mLeqUuZOdKFZWnu4S0U1VKNj7slUjxZ9ImbijYNthpj5+YQWN3Q9Dmk0ir
         knXw==
X-Forwarded-Encrypted: i=1; AL+hErHxBavhyJD7//CtuTuKxXLW6jN+nhUtAHfsHZhsYEAQkAzD8meRG2vbtCpmkadi1Fz1RWAEeA6xXwRvS5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NeBdhIbXYLyH7wC4EygjpjXDwcwy3xtEvuGyKX9qaCNC43o7O
	Ayh8BLVdSs70uH7NJrtg3+eOZv8yLN6JEcM2yr9ODYI2WwWIlRL7Q9wN
X-Gm-Gg: AZFdTZdWmaGCTgmkR3OmB5dTzcI+H2ajkNf52AmYr1hlr5trI97827/4rhceHk8De2I
	Q2SiSwkxCSXTKYLEmnnwDL0vIItAezxq76IMABUgTSb6q8IaTsDCvjLL5uvkMcIVBW+oiFwV8Gh
	6RnJPIKSUIKvCYF9owqxCoGv9YAUGAgWdX+iaiy8x+X/+ZmvqBmj5ATDw1tmiJLDgIEeaQi9urI
	t6jwb5H7ZSmnGpsPA2vY7KfSKP73rAcDB5T+rymtCrsX0DP27IIC5k2nfw/lF5ExvSCLsp1OLZP
	6VTsRplc9asUBbW3OQq03t3P/F2ezHicksPSUS++MXa8ZZwcSMldD50SfStFk32pbr2X6gAkaV5
	GRYQfUMiJSGMBCVKWmEFr21T4oTR3llCl4CPpkTPLErkUGl4Ckpezfi/b3PaNVxo4/2kLTJmEgZ
	u2n+h1wkYOo4DOwF/I7wIrtb3ePFtV321cz5Ab407/h8Lnf9spQOUqqoRRwspGMB8XLxHxeuzia
	punnhcCcUZokZtknUSP5NRVpchVW1XMXXQiBb5VMIqDMakOTgKtTxaY6KO/gy0ygD4lAxftMZDV
	lZmnl7qx36296rG4FdeBPsrJErU5
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr460217725e9.4.1795706829787;
        Thu, 26 Nov 2026 07:27:09 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm619118905e9.5.2026.11.26.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:27:09 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Thu, 26 Nov 2026 15:26:56 +0000
Message-ID: <20261126152656.3207931-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com> <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com> <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
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

On Thu, Nov 26, 2026 at 04:10:22PM +0100, Bartosz Golaszewski wrote:
> Eek, -ETOOEARLY. I have more patches on top of this already so Stanislav: can
> you please send a follow-up with fixes?

Sure, here it is:
https://lore.kernel.org/r/20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com

Stanislav
