Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195704;
	b=YckVS1JwKYGhVQXdJVFcvxY4RXK/C+KTfRt6dsm4xHqa67D11cm7pdi8kAZJYO2+uPVo
	 ZIHEIEnfl3GhguZHaJq0KFUk5m/5KzznlD5fqIpHd8ixNLyR5rkly6RGP/elQXLh8ingv
	 /QlIE6FT2IBugfy9x5HC5+G9VR80iViTrxd/zd9DKp7Zd7//msmF5Vcd9AXnkzWuguroT
	 u1Jsfpo+r9z6E/m5c46zBcmOWg4XBnmrIMDPSEW4Da8Nb8aXz3md5LSIINCA+bLTDafE9
	 NcsKHyQgxpk0Fo1Kt3oSgDn3SsPCvujCafZdVwJum3fQLmy/b/zJF0VTCIJHx0fe2OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n/R0PertKBznoGfoHPlQU/APASNGYYBgx2rkjYJOkqQ=;
	b=Qz/BTizDSLlFGNjYtfMEMNQ6dSq4feOck41h33LK5iqQkXjOeEnUurid/jbwyWJrN6p+
	 LHC6FifjxT20Q39PxmXACSho3ooUl5XwCV58V/V6tmtp/MI10IG639NZh2PCXINVUctLn
	 dtvDyxcnbTJlVxamvrMMH7bOTHSFwO2L8/EsbP9fv08hxlUzp86f8BD8s/T80t1mQJs+w
	 r+CIVTH6qBdhGDY9iBHzbN7K7aQzX9lQh7LOf3ssl0zJ8LHJLO4/4yod/oLb3oWKjR5qC
	 Wih1eBgXr/uWRTzU5tifhtlChpJCd+PY9z0rtlR6k1H2EFuSQJVmj/+lJapsYQinuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVQm5TnP;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E96A606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E96A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVQm5TnP
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a358881793so616050f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795195703; x=1795800503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/R0PertKBznoGfoHPlQU/APASNGYYBgx2rkjYJOkqQ=;
        b=LVQm5TnPlU/crM9dwG0oHQaaaFDL3Hwe3WtHrCGasduNkPbLU2bx2rIPjQYUlDi4of
         2biRPi2qIvMR7H8hZPfZW8q0ob16ejPFMqOiVAXiDOTYW+oXPghUkOODA1XVkeRqlk9U
         4bynLJ+rZqcDrHtg6vg4jPBdn+GQzvzXCT/bf4gXsc/s2s4XuqiqvyEjkxv4ax7rzWmb
         dFzPyfiqOdYWY2OC5PtlGtFrJrgM9FhbR5S1QUU8uSA87FHfCYZIs940dlIeDUJnJjDY
         +ffIIM9EjDc/4EJ3NlujMWTzBvfIEDItpw4qChJFQrc0wNVvJtM0F6FgB/Uj7rIse+eA
         4ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195703; x=1795800503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/R0PertKBznoGfoHPlQU/APASNGYYBgx2rkjYJOkqQ=;
        b=KYx3Ol1SuTvq7oOcB3nFI9R5/LKj4w6WaHWbMBJde1OuA/Gvx7D1nDAyHPjyUuhngn
         Q7mNygkaT2vYE1GJki8G7VokmYBORXVtTuoiW1JIGfPfiJh6HCuJzA71Dj8JdPDf3aT4
         awcq8UebhqoBfaocRqrZk4P+9gWb4ze6gXFDmLPzcFaCvvcRtxLqe/B2qlOCxePVbMEf
         2xMdRrUSETi2tCO2jMPvofNW9e9u7tVT7ILN9PF/i2kqbfGRID5WOEbE8FZ4V+SFx6vO
         RuWtzSKlOj9BDd4alJZq5wiUVfnvutUGg9MJeWB1PNBfh8Gskx8CqZIfcOjMKhD6fUPt
         8Eeg==
X-Forwarded-Encrypted: i=1; AL+hErFbsWemLnjco2alX5ovepqOSuMqHd1he1qVfLJOVQ9DKliy8vae9OVpCLr2G3rMLxv+irfeKNm4Ql+q2Rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ySMOF11QAigomXFv9/1+3b4IXjkvPvqPXk7daJox9yE7vDYlf
	Jgq7rDpW15HYdvtkDHY4shkcS7ayN4QippC9ec47KDy6HXMLJwB/kPlH
X-Gm-Gg: AZFdTZcYGGBw9IhwlfJC6Wex8n8aSqC743bSGoAPnnl1g/nHujKWY7nZeE28akwwHa8
	dVcbIs2ulHpukjxaq2uFu9TXW96Sk8UgtBo2xyIPyYsW9D/I9qCmOvX7Y5QIkLFgHw+tXKomqg2
	rjr7+J2kalf9Ca10i5HC3UDOdJqJeFub7dH1z45NMhhdfPoUYiejWbzoHHpBktehly8aSrWw6Tt
	aGE79wYl9W79CJgnGnqRMCIwG5NCqdJFkaAHhTtH1krOvpj8GpiKwg/iyjh9IIAGc0MjI3EAoUx
	ZabaBWKrWRS860whr4eliN9APQO93ZXfto3nwNEiRFi+6RTExx//oTVOl5H/Fj0og3oDyqZ6LOY
	Whe3Cl3xyOcdkq/ZfXOil0rBjgIH1ka0bJNopoP5pvwGJhW2b2pM8YXQQB6QSFYnCdeTZo7XgZw
	H1GtGhyVYnjlDd4yKFTVu9G8Zwt9v04k4JRdqvqX8tyCLF25zEkFRJXZrNgjXTpAx9k+XuKAbDI
	p75XHcmOfItCY2c95nIhqQuenelTHAuECFnjxu9AlJxrGcZX/y94RRHpTdjgNn+ghgen4hFoiDa
	MtSrsJytKLFcpGR+9zrAwQhebrAHAp/f3BrFixjK13GpagRJ5YChj93Hcyp4AEHnzgbvmlNmGGG
	LesajMBmN5XkBc+hhI7pbLvPxVZKIvhnmp4yHpT4X8djk930Xk15KqPtSRFmlaaSx
X-Received: by 2002:a05:6000:1788:b0:4a9:1649:9eaf with SMTP id ffacd0b85a97d-4abb86e5099mr7984738f8f.57.1795195702683;
        Fri, 20 Nov 2026 09:28:22 -0800 (PST)
Received: from PC-Marco.lan ([151.59.51.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm6670524f8f.50.2026.11.20.09.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:22 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Chris Simpson <chris@nilk.net>,
	Tony Garcia <tony@loafecho.com>,
	Simon Kruse <simon0x+git@proton.me>,
	"D . Manresa" <dmanresa@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers on stream start
Date: Fri, 20 Nov 2026 18:28:19 +0100
Message-ID: <20261120172819.257562-1-rylos78@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <awAUxukyHCqtABs_@kekkonen.localdomain>
References: <awAUxukyHCqtABs_@kekkonen.localdomain>
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

Hi Sakari,

Thanks for the review.

On Fri, Nov 20, 2026 at 11:37:10AM +0200, Sakari Ailus wrote:
> This doesn't seem quite right. The static register list should be written
> on power-on and the rest when they change. Also there shouldn't be overlap
> between the register list and the registers programmatically determined by
> the driver.

There are three such overlaps in ov5693_global_regs today: 0x3820 and
0x3821 (FORMAT1/FORMAT2, whose binning and flip bits the driver sets
from the format and the flip controls) and 0x350b (the low byte of the
analogue gain). They predate this series, but I'll fix them in v3 with
a separate patch: drop 0x350b from the list, and let the driver program
0x3820/0x3821 whole, including the bits it doesn't manage today.

For the rest, I'd keep writing the mode registers on power-on as
before, and also write them from set_fmt() and set_selection() on the
active state when the sensor is powered, instead of on every stream
start. That needs pm_runtime_get_if_active() rather than the
pm_runtime_get_if_in_use() the controls use, so that a change made
during the autosuspend delay is written too. It fixes the same bug:
today a format change made while the sensor stays powered never reaches
the hardware.

Does that match what you had in mind?

Thanks,
Marco
