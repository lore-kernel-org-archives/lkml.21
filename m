Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636055;
	b=BliTHfrLrBPYxclYIS6IOL+esY8bHITpeZD/vbfNrybU1FtAORwtbgMdrx7RZKHjvs4v
	 GUV9zIuXTP7J3pgJ1jdHG0mcvIaMny0RSK9RCQFeYwOyABHTnSikaJ4gYFsMF930Wx3dL
	 0TelZsMaoVa4+87N2DiSOq8qrXvjS6/K4/97EpxI8UVq09fz0sD2sN8WynlfKE7W6H/om
	 a8mQ4E7nYoAP6jxIhqhi9UxVx/99Yz87t672rtEtCErHBwAm/IMeHDXH09nzkLSusgLDg
	 0inzxDe4Ly17YsqRi2lY71SO4uGQypwNnqL1igKo+CtHiSB7epP8iRUGOjFEphj2Vgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=grrU0uEFit9XRwVTApcRlB5D+yBJZUkCWHnay5I3nKM=;
	b=vFZvx9ALDrjfcimGnXq6uZtHjJIrIo0Jg7AV16M8o0ERVmH/RwXHedeO4hLfuol+QZbD
	 DBCFxAjBXGmNzbELvW9fzpQ/7AMqgHpyR3AbiWGM/OYJXvbqBwxY/UVNwbccu9Ee1JfNs
	 hHhsdq20wLV+b8v5afwTyCpZRzfuWNpJydZUpxbP9mv35xJppMWzMfKunBK7jVB5r+T9z
	 kJsevxdR9L9PGmJAEiVd1Ge1+AlnS91DEC9SGZhRxLrFzi+UAM8krhZGdGGc//suBYuCK
	 +fbYWhCTUeciGPVa4pyV+XLka+S3ftddsLgTUz3s/8viyKtMJMpn1PYDtakWs1VeUxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKyKp0qs;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E81E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKyKp0qs
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ddef424972so5032384eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636054; x=1796240854; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=grrU0uEFit9XRwVTApcRlB5D+yBJZUkCWHnay5I3nKM=;
        b=TKyKp0qslwB4z3SvhO4t2bcXRwL3CbBD4oIxzuOdwOA3zSwh6laUJbsIJiqpFPtBsO
         E2gkpHjapAYrqOU/QAvG/sHwHufNeA0D4KHGjBeaIxTr7r5WC7KPNn9fQLaOALX2YpUI
         QvMpBxm5VZuLfOH9WZldV2+mYW0kltM+0PowVuLeCNpCuUNb+mDT2Xkm7xWGgQWwg38E
         felaFX+EdWPXdC6zmnqsAec1WHvBPc0rw9vpHZsiZr4CtYz3hzMZnvuHYzFNERA7qphS
         9QmC8zFpC2uEMTpqh4S+UBOsYHK4TYDUAHKnrmfvsFkNN732ehxvYmgPGHpA+OzaaIGo
         CxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636054; x=1796240854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=grrU0uEFit9XRwVTApcRlB5D+yBJZUkCWHnay5I3nKM=;
        b=AmQUbrqgUu3/rlwwWxsPrwT4VsQGhn1tU9SIf0cUYj/xDeg6Djd1/WjFRnisTbeAm+
         xYNNGL/0fAxKyVPf1mYpMPH5bz676ogKsVFUhRn1pdQu9SP6MtnvtKYWOvIk3gTettdT
         FlT70J1/C1LONOyVK5dJNPoFRyBhYMC8DTOsjjMNXB+SdHUHJlUVA/69w+2iTGNgIiO1
         ydqErFUJISb38T2TP9Q2Fmx0Rfv4MoIbFySbX+FVgaeX6MwKxnfPQtB/pjv6+AuW6fEq
         IY3QWTOzRNWFSSMdSy1IJl4R1KNYSz3EQ+D9ENNwK5LsM7qurKKG7IgCS6YNycAFroBN
         JzpQ==
X-Forwarded-Encrypted: i=1; AL+hErHyQdt8/tnXOZifrjXAXAI5Gly1gL7YNOEyjfyr/J1GlAT3JFqjmFDhk5i3iNmRO2qK3pztvm4D5M/MP6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AJPNG7JZ997t39o354wk8nnHS+PC3oDl5FW1ozRSfqHaTLC8V
	Juvx1rQwJZ93wU/p6bD3jMhX1PEUhwxaetL8KYBG/F6z/AQBaWg7Oa8=
X-Gm-Gg: AZFdTZdw+zBI82rMpGdkL+puWUDw22Ch0tssgnJkRWOpMjb+A9Ee3wD0NyNgFXa7NRa
	N9lUKvUIRnyFZ3EF0sR65NGUOQAxQ74yFEZojtB1msEAuc8t0mytFGpEkgk/ZLMSWR4XzB/88FQ
	FZLP0HqWgCbGKsneK2SM4U+UGBEezFE6YlBxfi1fNbcnxUQA/ns1/VvJoRMCrJw3o4E2VEvgvbR
	Z6EEW2qCaggMwPcCGf8HkaPU/b11jwG1ne+UfF2zILcJ9L7jbOlJK0sMqdg/wF9yyqj4s/rIvkk
	dfjO+fSZ8X9+qfvNk/WWYFwG08JClueXUuPEUT5VWi6G8PPYxRSI7PgX/HKnG6RO7wVgMNXFr7r
	updQUCgKpz/yRvQtFdArl//nv3unyRPDIztEl2daG4Qrr0dAel/wGCQLfxUWzu2JtRLsKeeLVmF
	XJIZzdF8bgO/R6FD4Co1TVUNyTGOr2DmNddWlx5knwwyp0/uPqvJo7q+YNu584JE6BZTd1gDyem
	uljQW8N5C26gdNqwRoawA3U8hCK/EOtvETk3mzMSaS3BSU8EJlHND2J5GKUodDKv0a+FGDK6U6r
	KxWixojnAz43gAuySmiWcAt8qS9NSuUA+uBjidHhR0eM5UfV75s=
X-Received: by 2002:a05:6820:c7d3:b0:717:163:aeac with SMTP id 006d021491bc7-71b39563bbemr12689828eaf.68.1795636054231;
        Wed, 25 Nov 2026 11:47:34 -0800 (PST)
Received: from miso ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8345e1f1sm1121467eaf.5.2026.11.25.11.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:47:33 -0800 (PST)
Date: Wed, 25 Nov 2026 13:47:32 -0600
From: Matthew Laux <matthew.laux@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 10/12] media: tw9900: add S-Video input and
 progressive source detection
Message-ID: <awc7VK8eOleuJwKW@miso>
References: <20261121035523.26764-11-matthew.laux@gmail.com>
 <5ff7af23-de12-40cc-a8a9-29d787873837@web.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ff7af23-de12-40cc-a8a9-29d787873837@web.de>

On Wed, Nov 25, 2026 at 03:38:01PM +0100, Markus Elfring wrote:
> > +	mutex_lock(&tw9900->mutex);
> > +	ret = tw9900_apply_input(tw9900);
> > +	mutex_unlock(&tw9900->mutex);

> Under which circumstances would you become interested to apply a macro call
> like “scoped_guard(mutex, &tw9900->mutex)”?
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/cleanup.h#L325-L328

This is a nice feature - fixed in v8.

Thanks,
Matthew

> 
> Regards,
> Markus


