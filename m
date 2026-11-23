Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416477;
	b=GG2KNfAHHhpSLnsaRTVG6T/V4e8zfcU96FLngmestKpcckoJSuBC4ECuYFljw5Xoqv2n
	 x1dbZOijP3fdFANOr3xBuoxaRIFKB+WnzTLnXflI3O9aR0Rke5UCDwABFrKswchu6pRoM
	 MKVqgZ0z50i/ZQFK4jHpcBiCNdDLihG4QTIucVcFZumOWaplQgYoIC6g9gqXnsGpXhsRd
	 CiwmNlGA80JE+KCcn9kU283HVJYUn9GnB+QpJZZBHzi0UR9dqkT2xOK9JUqEF/U89/44v
	 rNKqhglgk1b85c8MfIw/EsvHXMeeOLnHhSfeMBYeyVeNNQZXY+yGm7lm2VLTRNTl1Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=MpdWRQGt7FrCuyLLRBTmUxjIIESLmxZZy2MLy3uKw7k=;
	b=iPtOTe2LdWImVd+USvDFFU5PhUmfycTJkidsmLZG7cT1QfL4KrSUOBIa+xzWKBz6VbvZ
	 W15t+kyv0jZ6JOiwRWBI7yK+GDlctVLAb0VRP8VeOkIsSY8VbDj7zu0ddtFhFGbE4wiAC
	 IEF7EnHJ4g/v/70jfofXw+8XT3Qqo6Vl0XSSqW36/f8UNJOI0YKeLmsLc7MxDmc2crafF
	 mhJ9f8AhvWq1w7W0esqRgIDCuMxfHwcLhVnSRK0hxSaMtL1tF6YaBDHjGVVTB3conCzj9
	 M+8lNsPGPldXTJQHNVXRmZHfSnLCjBGd65bjHuWccb3V7Zys2jcWvKtbPREwkb3vQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sui00Ob7;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4DB3D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB3D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sui00Ob7
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1533324b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416475; x=1796021275; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpdWRQGt7FrCuyLLRBTmUxjIIESLmxZZy2MLy3uKw7k=;
        b=sui00Ob749YP/4E0URw2ubSzDUQP9KyBjfsmmDw9AzxIDxTYS6M49S1JibeFvPEBVc
         qxmPMlLkjqeHtjjaN7HvIH7fHwsh4z3btvPa519DONCM3a8F31p3NAmeMGSbIBAqhVXw
         5txmr4OBG91xAg91dxl180zBYNgs2sAiXvTgDE7cFJeajijmCEsby493dgeu2NU9qZIe
         AOvHl8i6VREYiO1AJs8bd9Y+u3Wd8mtajSfG6AMj9CMP8bF0uqYgd4Y9TA7w5AXW8uDK
         YQ+QuR6/yknUWT84taqMCfSyX7b6XxC7IIgRv2PGwskSgwLDtlasV+5SLJy7c7g+qSd2
         P3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416476; x=1796021276;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MpdWRQGt7FrCuyLLRBTmUxjIIESLmxZZy2MLy3uKw7k=;
        b=k77RzlVWrGOfJac0BM4/1A8ktH4TSZcGS8lM6z96TdbEJemIx1cWcI7/Q2IRml5nXg
         6kZ+HfIqPsqn6UzPffTA8taSVFWmD4F7KLLPmOrrFIE8A3/tUUlBVYZ3KZSBbQ+HO/0H
         R5enP/Wrw5dgSgw4Y65IVgaDcGbbykfTjtGKXqairCIiIetO/yLxXCTssz+dmmklndip
         SE6Rq85ngGBmA7HnWImkbWtaNtOLPX4EUYM1k8AvKrw0n39cSF9j3LXz9b53zLlOZKie
         l6AwAlwPB9fVavmPId3TwoJ6D2ZLxEkWXnocLnMHUWosorKB8W6TMR+5wiqbWdmtO4KG
         3GqA==
X-Forwarded-Encrypted: i=1; AL+hErGBM9ZW171fFmcyr5jRSjQosjU8/+TXvB/qeTPMig4amZ9JQ9UXoZl6PhDfetyznZCPbX3EWsemk+oJ0oE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kSnFoLixHJOxkXZU7JiPjzc7P19BHhNsGb5bzF2Su1h2FLq2S
	guumYrJOIMFTxJXvj2MW3DCTaSJObAk3Zn2M+578GKglsfQIn6HsBNaZ
X-Gm-Gg: AZFdTZdj5hA7q3JNg8cXBJvESRkFNP3JifSJo2CuBVCuNN9BnJ6OZaQj40astkOnypf
	CQwCoGWzD2wt+iRb/nK6/W8UAcW6H68Kphc43XvTglzFhGM8aZE9bPkfr+JiTxLoBhYGKmcZ4fK
	FSjNMtLjlbG7Vl5dwOV1twU4ZeDSJWCWuAiCeCVRacsm72urgaOsREhmq2unrlKPJWIR0iy7aUq
	JuOw/At7wuIj/VlEKt0UPjQWnn8pHkg1ohtd6Aalqi3PlGvGQ5zjcnBqKfeLCUEwBOoIQiK6yAM
	vtPWNNkY6r8wxyqEK1lBqdpMNtag9UZaxbtOBd3riCdhxC24t5K00YCl7GAr5XSYkGykTtUXs07
	QkugFsXRCAZU4uKMFN8TbIbdbCpaLBK44+Cpk4LvnVgPSLsHAfuhEIY3yHNdVdNws5/+ViLF8b0
	tTeqecop3xallH48SwTju9t5hN+fBZyAw0mu+wk3XQ3E/mdkAT+5c9mTfhbWewRm0ajCJxzW3z/
	UlL4Mqq9Sf9zbpJD1O8/VxIdeP1KL6TAD/v82FXfnr3vntJUnaVhr6X9gIThaSC2wq7K6UuV+mO
	f7+8d3luBYQruQJu8Mj8ieKRkmJngRnc3hdqLIeUp6OOFHCOEdqLst/rC71HROdUnJprOw==
X-Received: by 2002:a05:6a00:2196:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-8c87c6701c8mr9415691b3a.37.1795416475541;
        Sun, 22 Nov 2026 22:47:55 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077fe3fsm5152686b3a.4.2026.11.22.22.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:47:54 -0800 (PST)
Date: Sun, 22 Nov 2026 22:47:54 -0800
Message-ID: <5ec374e9acccdbb5422291d106bd9ea9@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Corey Minyard <corey@minyard.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: docs: update i2c_smbus_read_block_data() prototype in writing-clients
In-Reply-To: <auo-JCn9VES7OwX5@google.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com> <20261024-i2c-smbus-read-block-data-v1-2-19bb97467982@gmail.com> <auI4Qq1KUo7YYVtG@zenone.zhora.eu> <auo-JCn9VES7OwX5@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Andi,

On Tue, Nov 03, 2026 at 12:04:29PM -0800, Dmitry Torokhov wrote:
> On Wed, Oct 28, 2026 at 07:00:49PM +0100, Andi Shyti wrote:
> > On Sat, Oct 24, 2026 at 07:48:42PM -0700, Dmitry Torokhov wrote:
> > > Update the prototype of i2c_smbus_read_block_data() in the SMBus
> > > protocol function table to include the length parameter.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Andi, so will you be picking up the patches affecting drivers/i2c?

Gentle ping on patches 1/8 and 2/8. Will you be applying them to the i2c
tree, or do you expect me to queue them through my tree?

Thanks.

-- 
Dmitry
