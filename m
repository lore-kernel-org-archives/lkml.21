Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938190;
	b=kudSIPdtbyeP3RM2hgk3qnNC8EsaISRDQz1F4MCAXAZ/ZDz0qhgU6RdoXjufev+MoB6a
	 nZkFROIoG+y7GNJC2nizY/AY5aoOobf8NjLDmzE674cJtaaNa5SRB+5ibbGl1N6OqFd3n
	 uiz8T6Bp2Uw1yBVmnSbR7XxCt0LSYm/9zu2oSN272PRQuAFfHCKbiVn6DLIfV3LTBwlqJ
	 sPhZNu4kwTCcDNK5GTYtGWh9nEX79rwRAh53dQUNpQ2BuCsj/VDNN7ZmvZTXN1/fT8cw4
	 WwdasS0DadxFatdYQ1Tz+WSvtkanSOGOdjfVJHxTLsFcWAVp6x/cj3iBf/vUbkkClQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
	b=utc+ekiS5s+3W7kwQN9GubJyGSh26Rqy68jZSicjbchm69O6rViJt9/ELdyPJzv209lv
	 UDh91Vc5N1tIJOh3MVnznYJwLZA1gF/DGTmbKiZUVle70h8g9RKx/Hl8eEJSIynVmjvEt
	 wRSAE/t0UevVFSoXO1gpkcHLlmOpXCM270+70cn/DCmsWAa7Ixc5vV0Pn60uuLxTNMIWa
	 pK2JrLG/UMhZsn5rq2J2yyjD5mE+k23GUUzHT2DrYUIoi93g1ks1jrBTEnrDWIs//6XYI
	 bmDYLMsO46dOGZmCwIRG555PhboNvGeobXBwesqPkyUBfcoZB/53SNIWXwO7NcAM60g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGgXECm1;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACA6606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACA6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGgXECm1
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b001cd92bso20449f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938188; x=1795542988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
        b=bGgXECm1LP9RW5geQBlwXHQWEanPdLe5eA/jns5JvGNV17/XRn1NU8B1+HaJacOx5G
         +Q/7cGx76qwnPbRqUr381I24iBqBcHXkCaFJjmMXxOSk0wIkju/FnRbDxT5T2shLt7En
         OHOQhZvFompfSOMpuSMZ8Q3d/t6SMtQ5MewXXPxKfqDnffXqLfN0MZvaHDuV7ey+YkkU
         1KNy0EZf2AgevVQ1qNd1n4jYQEsWuMaPIKjDHsBTAJwDWi/AmFahlUqd7cpuSYUNtJgE
         kC9t6Hicc6pRXdY9DkSeBvMMT40nJdIfmPpRadUn+PzT6POBZ14sk0NzYkK3xBpUxzaU
         ad+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938188; x=1795542988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
        b=GrDUpfHfAwq/LXJY5BrtMeVQ9bItLFgJ78EHtJ7cdIZ/nbrUSdv7LRObFGdc1qtSzU
         ifLpzkq6WP27w/zScv7zBEdlf9BhiCPhk3tjYBSHfnAPEZ+fA0Tkgs7PNaJMf/jF4/yI
         8S368XIsVLDhAVfmxeaZNA2b6PLbMNDdENlIW8OiUizLiOewQ57BPCKOmeQZzx+ZptBO
         uPss5ZZ72tHfeMf90SLxaOS/i243oWya3Os8eYkIr2X6ImLpn3z/rfGATFQiJrmm1sP4
         c/ZAlmzBA4x95q04L0qnvdYtRUogVP3K1cg/U2rh2Klv6lpY0YpfYAdih3rtV0gozebY
         fArQ==
X-Forwarded-Encrypted: i=1; AL+hErEdl8Q/7VlRZSsbH1Na+rC7ZERT+JjOGS3h1ZckMROUWbtFdt8l7Ac3D8BGHfhliIZzgxhHGNWb+/3/QDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o1ETKNEKUM9XyEE1f7IHxBiXqDNEWUJh0ZY9dPzfr8YVL6ENM
	giN9PYq8QWh0h2mLcU1r2vCwV6l5ETSUZDxKiG+I5yMkkO5QCOWOqzjj
X-Gm-Gg: AZFdTZfnVKUlv2GW3gPEG3Xf+yOjFtdQ85y0ZaFR6VhiSOsyrd7iimN+Ra+uapGvmRc
	rwt/IoMxMEZFqwdLQuKCmZhbcA2S3erzgZNwUlf5XucSEX4KfDGrhNVnt/2vMs6oq1AjL1mvWio
	n9f/ZXGlItJ/pm6IfVyI29l6T6Y/Hx1F5fP6y7/qIXGGkFHd5GanaPINUMHLcWQJ4yXespyi+kX
	DqHW6Um9rmey74p4PyjFqp1XlbA1Yb6UhwLPBmNZsf26ODZBWGMGX0Gdl7K3BnpA23gmE7PCbVn
	xEaqfgIEg32kknUs1jkMQe372GkWpUSLpClCS8PBvBREdKa38nOQ+LA09p0rfATkNo954ThIomv
	73XNzXRwwJoRJxsWn9rVDiy2aJf14KBlfD4xBG1Oq0Wu/rUy5ZGGjrccab+WDBa4bqsD2HaaU2w
	/VSjFEFSSCrRTb8k898n4rfUDfc6mIzjKef0biNcLRgQtPCsXT09/o22VyfUq4JzYnpQGafibF2
	vqYXJ8Cp5D5BvTMhv8jPsa/JX2Pq7zpxFzXs1JqRl1Opyun8g5aR2JFQ8knj8Q0g6c59i1I0gAp
	91AXxgU2Uyy4zIXZa39cxO1qxvuygWACrGsoKXWm3VfWVA==
X-Received: by 2002:a05:6000:26c7:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4a639ff6138mr506509f8f.32.1794938188531;
        Tue, 17 Nov 2026 09:56:28 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm47723f8f.18.2026.11.17.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:56:28 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: andriy.shevchenko@intel.com
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Add Sony IMX175 sensor driver (Lenovo ThinkPad 10 rear camera)
Date: Tue, 17 Nov 2026 17:56:14 +0000
Message-ID: <20261117175614.11710-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avwnh1o6rFzayxkj@ashevche-desk.local>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com> <avwnh1o6rFzayxkj@ashevche-desk.local>
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

Hi Andy,

On Tue, Nov 17, 2026 at 12:08:07PM +0200, Andy Shevchenko wrote:
> > Not supported: the voice coil motor (the firmware does not name its
> > type) and the LM3554 flash.
>
> Why not flash? It's in the kernel provided by drivers/leds/leds-lm355x.c

I should have mentioned that leds-lm355x cannot be used on this machine as
it is: it only probes with platform data (it has no ACPI or DT matching,
and nothing in the tree provides the platform data), it does not drive the
LM3554's HWEN enable line, which has to be raised here before the chip
responds, and it registers plain LED class devices rather than a flash
LED class device.

When atomisp's own LM3554 driver was removed in commit f1aa35ab5943
("media: atomisp: Drop the atomisp custom lm3554 flash driver"), the
commit message said it should be re-implemented with the
led-class-flash API if it turned out to be needed, so that is what I
did. The new driver binds to the same ACPI ID (INTCF1C) and uses the
same GPIO order (0 strobe, 1 torch, 2 enable) as the removed one.

I have sent it to linux-leds:

https://lore.kernel.org/linux-leds/20261116180809.26946-1-volodymyrchapman@gmail.com/

Whether that or extending leds-lm355x is the better way is up to the LED
maintainers; I will ask on that thread. In v2 of this series, I will reword
the cover letter to point to it. The VCM has since turned out to be a
DW9714 at the address listed in _CRS, and I have a follow-up patch for
it which I can include in v2.

Thanks,
Volodymyr
