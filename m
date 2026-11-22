Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375155;
	b=esfNgRCtuaEWlKJKBmy11DQuOMjkmK/avhYe5yhOaK+fD1IkUdmVtNsj81t4/vfM+P3a
	 fvHg7HIJB1OJAEFmQDwONFBXPXbOxXW1ERvWNhegLY6n/+1m2UumYzl9vxOTzcQKXRgYW
	 79Q/PdBQLOCxHiH7qqT8jSGHZ6A+Gvqr9fkw6cNdhbi8MBBxUJ1oxJVf+MssvdY6T+3Ul
	 KjMA7Rz/4wc8ykvhlHtvY03HCkeU0QPLzyj/Hg7rtgllcKrzFOHDXOTDaq/CKzC71ztts
	 2EwNoLXdzjbx4Mi2YH8zarSfBMdYdsjpV/2N3O6zo/Q5SrAE8F31yrMY2R+nx+04P9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
	b=vw2nAFqkdCzGUB1+4qSlTINSwgfzrsRXpbfjPd9Y4+3g49O9ZdldgQA79BpthZhEvjqb
	 LR+anwKcEnncR2fZd2HsPWSZ8EveGB5Bdv28upWkn94r+FLzLwf1EkrWCqRAAgI/QI0MG
	 57ZB9E7R22pY8Yg0QuDmRCkDIyphntx/GPaQmNRV+StOzNleXxwzYfkdn+L7Uew+Zj+mZ
	 +TTT7kp173TxMYJwlFJvFYP3EUzG5UmI5bD0K23U9o+gSa2ubYJ1d06Q7ZKH28fNiXGUJ
	 HmyY2je99Tz02Q6Y99GLMKI4PPWNYxhHkV0nEQXPvLLkZuTwiwxA539FcU5mTz1RjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQdClBoh;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B640606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B640606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQdClBoh
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso22767355e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375153; x=1795979953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=KQdClBoh8jcCpLG7uk8RfQGxzzKTBS1Vz22R2mosQpM4g6tHydr9advbfUzmde37yW
         STvgE+LR7Rx+tCs7ZvSTW6NpG5uHYbFiwxwYFAr1VQRb0XTXknUsRJys3QqBs/6rFsm/
         swBdSyIk8a2U2PsvjiDvKCnEJla209oAQ/CxXfth5bmZlFTiACcIyFSVNK7M3NsSCyy2
         ZnbSOt4uPkTN9QB/3EqwltEuRhuJDLVxAfjwO2c4TToZdwSBKfs7rO62I2ogcsw0SeYm
         QJfCdhXcwZJMkSkyIAT1mzeq4TdWs8muaXAuuTCINtHGVBcciTDtufcEs0RqnAH3XAkJ
         h+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375153; x=1795979953;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=NUIWlWMN3ajBKSnLky+wZSKevoBNc6UAxWCCNdUqotFWNjdwejCyHKgIMp302+v6I7
         rZEdUQTDaoWfcEcxd5MZd22UHYiUCLwL54kpdzbe4/0ls36dZeGmTaVc0qGIyISWU5v1
         mf6ioCFuNyd5oQ2olj2UFfNuMklXDScUxWqskZUGjiClyOHUhH/UW7R4xKvRFh0uSOhJ
         Sj3oVkltrZh9iW/5635vxRnohwBTiNOpCCQZUOs0GynBwk9McvaqNtWT2egCVntHPHhi
         yTQrzK14W+ZYdtNcJXima6heugZxjyAdVzwzFj/mx56n1RuL4ZxE8rKtzn7NhI5GSiWj
         vwbQ==
X-Forwarded-Encrypted: i=1; AL+hErHWHvfooeJWj/OBZs0bEvyiFsHaQyaYCrDBLSt8xbRalw8QN7nNQpn2nNghd7XmM5Z/6xzJvvwb1ZEUkas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EpHdYV1MbVTuNdktigtSPg5ajccjB7GrHj4ktmxHY0se0FN29
	z1qg/BxIfIEGLiL4NDx/AKzLh3bdh3W1uI3c0FaXjo75ZOv8M0VpE3BA
X-Gm-Gg: AZFdTZeRbHL1kKfZ2R//u8OwaAjRM0Yz3UlA9iq5cD1t45H1I9UyjIibuc+tQ/9c1wc
	otKcknCFD4v1BwO5xi0r1TcvH1OYU2T/H+B/P+eiIVD7ZSF3MBxOGmEECNsBut/BWr6LFOJ16KO
	bWH9Eh+hHOcApFnhqZmJOKNsNhxyauqypC4BpXZcxwVdtGQ9OHw+A0hlG+CY6bJGDcTG2eRCK4P
	UBMm7CKuuL9sj6URr2FHo3Tyxat0rC0XKiWpytI01tnLrQWrvd2JVf2MiggjvwEuX4rRAdweH6f
	seRMZTTSjC45oslvY0RXCF6OaD4sGQV29gCVg1BQCFUcrEVdV743rXDZtJK/CS6sPzR7VIS99wM
	eiTrLBjf2srG1+TO23oKbFygrpP3rblS7gqrI2zRbWxyp9km2YiD0e6ps9DWyNY6DGfBwQGc9d8
	W8CmAT9AY/h2Da6iDIPtK2bkxQjWWkKDJGBLtTvBWNZr+W1+dD4E2lV5WYvUqHDP2quhG2XQ+Vg
	ehnaO3/7mirX47rZWPDRlrGJxeSW8vY8MeDgXlLo4OtThTUP+LpeDoMR4TtKyCm0pLxHMDkKsey
	e08Rvfc158ttqHFGv9F3ZbowcX6F6auZ8aBfDXQiv7I2
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr192535855e9.7.1795375152884;
        Sun, 22 Nov 2026 11:19:12 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm17465595f8f.56.2026.11.22.11.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:11 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: eswin: add hsp bus node
Date: Sun, 22 Nov 2026 19:19:10 +0000
Message-ID: <20261122191910.2184037-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-5-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-5-pinkesh.vaghela@einfochips.com>
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

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
