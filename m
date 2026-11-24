Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541640;
	b=q/6Zvkec9xhx/finU1W22nz4Nnn+ZApvdilCq1wz30f/1xp3qyOwXgLdGO8hqP25/FfT
	 /6snD0X8fTQyYGthaahnvcT/Vyr2k+kihiKkDFfAFA3YQvyJ9vKxvXxw8aFoIxXJzbmoz
	 oMjFLE5W4QN5+rWM1gMwJrppsjmk54h4J1nV1XVsIXGEvpPddbHTVxUh8CZOOUX0Fm01V
	 P+rUbd2miwX/Pg9r+XY+UmXmDFKjwvDXPJGk/1/fSjPpJlraZjN/OH+pMj8UIbfQeA6bW
	 QhQtL0EPBGiPzvUObW0RjFwRUxa18zPsmfdescIFQB8nyFX2bZJIvd8BG9A9/VoC5XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
	b=2JD/t0GzoiulNj8xkjfKUCHPUK+fqzMEF2pIpEd/YOgjVK4kDcYKdYtujkNcQDmJC2iI
	 cnhCoEcdbliwcL9tGvz23978bnjKZN6hW7Rp8EDco2i1oRDt6Wu9K3OfX7iws8NjgD3Ls
	 sQKV7ax4d79vw1D842wqsM+isT14TzmXkGKf4zM5JHfcPF9uWjH3CPBx7N+KwC5LDcUyd
	 jZDBC57RVPB506McvdaS/Pm7kWEFsW3tkXkTsDgFAj5T1doZ5ne0IryuuHLTlR/F5kLFt
	 a2HQ+O/JOL86mfCY/75Fvk/ncNonuDb7OcDERUxlLHTSRk5owjctk4y0x2ShEL49v1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWhauDVf;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6CD606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6CD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWhauDVf
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so4231310e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541638; x=1796146438; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
        b=DWhauDVfAmirslFngHjTM1mnMVETNpzC4zCZN6Nu+H+EhFIW1EEv9E6qUNcbdXp5+1
         0iNlpLKUe1Guc0WO6iclRDlL2FbObdhb1InOgL2bK23VPErxebNUqb6vlIjJfrJhutuz
         fAp9WJJ6VP1QNvnXVlxV4KqDZRdNvCWldx1WpPDESL2wvxsBdPh1dEFhxFGPXBw4JfxT
         GDdJaiu+Rlk6h2EV+32PBMl8xTsqxq3qGvHW8OqCqyVyuSWcziRUT8LHfO7RXSFmTkE+
         f0jbOJOGFh9KJAtkYcn1jePsLEAldHTxiLK2g5SrnhAJ4l1QPfnR3f7FBPGl86NZ+hsN
         5S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541638; x=1796146438;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
        b=akJZbFkyg2qmFmgVWJt6qdYfPaU4iF3fTqj9/2XO6d9tHC+EHZNLxHN86Qmq65tGAB
         iwznMyIm8s2YegW+WZHtVg9gds1q/xrTS0AEzEHxbIED/fZ28Gl3S/7dBzzcD6FQji6u
         NsYsIHdQDVJlUDl6DdJ8n1BsjajfrK5DA+ud3lZvqN8pwMIUf5wKucoTtEHj4rGZzn28
         NkRkH1jR9/zaTm4aUTWNVizjgBlIReuEI7FTzDIcgAbOhN6ZYKZCpgDBcT2iQyrVlGH5
         TMOBMdA9xy3G6lPZuC8ImKEP8RYcN5DoUuxZnlL7NFc3T74XgdSm//aAGAwSQil8Lu8o
         vsmw==
X-Forwarded-Encrypted: i=1; AL+hErHzS1qOx75Cx1V5yqLCrn6TSaLW9minmFFdgk3z6aKtJICSNZn8TlsbuhQ0ShiXBxSC//W3QhwvzPBj+dM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ABVSeCsUy4mhL/hzCf2FIK72L2Ddo8c/Y0t2vMxf2wlXSkNId
	VY+cwS6k/hIX4ZWtCIWKReksyqw9lzIXYkWFkQ3ix2ujZsEm/iItAVYHTNsFRK5lCnx2pw==
X-Gm-Gg: AZFdTZfTBnII2iz88jRmLH5sd0d+0nhxRwzf20niaLuqmAtzLfiaVTZ3Fkvb/WV/19R
	WVS052NHCG2e/K1SQLEGnaXkBosOpMRUWtw01M9q7dDabofkDIEDMkY5uug8vGllNDb0R4YGKny
	5/+duqSlgLWluPuPl3hUxePVmBnP/im3sdEyKtCwY5myW8cBBaneqXScEfW3pZhXxptn2QnjHYY
	a5Pnoxrlnfwc2/EhNYdr0T6B0/itrgheN3kREgFGv8zwOq47UMHY6IxVvfeGTAn9rzgsUHfGPSV
	2+T5TWQ+cB2zMrEusUNvrZ54mE3H2eLsXYJZSklDriZvABa95cWobM1+/ORSU1jOuHDClrWZzqG
	NSEd1yQqwDbIieudFWUEVcYC/DeA0NaeBaLSVYaCGJ3adwjiA0782oD+mJKFiqWlvEinSvTtoE7
	yTwRmZVCY+qffdQn0eQGpRVWHVZijYLOXOXoDst8l/94FzukbqOJFGeoNTPKSkuOTmz8/b+w7Rd
	5qc25HtFpSMnkWSD8+eq/bL+rb4jHHJXu+6mZsAvipTc3036XJSvGBmDhTlBpyTcPVKboMTfVaL
	BI3/bTQnVCr5SExmCnnkQ5oO+5jpL4e8QFkHK8cSIlKK3lp6u9pmpOs=
X-Received: by 2002:ac2:4bd5:0:b0:5c1:ac33:5a45 with SMTP id 2adb3069b0e04-5c1b79fc8dfmr4560944e87.4.1795541638132;
        Tue, 24 Nov 2026 09:33:58 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8bbdsm3990097e87.28.2026.11.24.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:57 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
In-Reply-To: <awXFhjXhZ-e_QM_R@x1g10>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
 <awXFhjXhZ-e_QM_R@x1g10>
Date: Tue, 24 Nov 2026 20:33:35 +0300
Message-ID: <179554161506.57.3046327489415683188@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Brian,

I'll move the reset controller to drivers/reset/ and send the CS7542
clock changes together. That will put the strap-selected clocks and
the PCIe gates in the same series, with one binding for the global
register block. I'll fold in the remaining review before posting it.

Thanks,
Fil

