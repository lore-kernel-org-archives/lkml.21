Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375146;
	b=4+tNE8uUR7CyAw19+n3e+S7Py4iF5AU5mJJdSYWl4pCu94zRi47xRDi6rlefZmZrnaIW
	 AUI/xe7H7yFJZUSjXotMCxTQprpHG4zYvfnTYa3KmlByclku7O4QculioBU6XQwsKSFfU
	 XlWNWX69Me9FkxsVWBJ+NW15EKgeK4n1cH8nxuAvUZsGXqr9nR34iq95tQPqUNCui7d3W
	 Ap51EtNvuNGzx3cjyyzYdKHwh6F59dM/U/ddWGB7gQ8Yx5Z3H/4o0ONTun6/EgslkdQsw
	 bYJVBKoKyWo7OautCnBj44lVFEb+QD/bqP7EYawDnefK+JBIU091kR9i1ml7Qh+BtUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HsCFnP3ndBaofMImQLbTwSbFB01O6iMTbveJrzxvAyg=;
	b=2zsr1/3nitYl1WZAI8V8JQ074dkOtQdQ9eI7xv4bBInZK76pApo0oDxSUvWD2lIziVf+
	 CiBCyowd6CDD4FJSg8EY8g5lsEnghpEiM2Bh7dRev8Y2zSSmDIPBLiF1dQEohFHkQBk2J
	 dpQraoRPoPyWtqJacFBXJTdFBfCiqcJhqcmyMbKdzbzaCKEpraR6/Z1YhiP/lRYOx705T
	 G6RrMzESSC1QMY79MOCN05prepgvfqKEsxWUL9+zLiM+eQPpgwDZtu8kY+ZrTnpaVLJeL
	 S7zR7Wf4o5CHFKmVa4Lj5TGXW8b6ja5hha2TzoH04Pinsn7gZrauZJXJWvehoHYSzLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANktN+JD;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANktN+JD
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1575340f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375145; x=1795979945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsCFnP3ndBaofMImQLbTwSbFB01O6iMTbveJrzxvAyg=;
        b=ANktN+JDfZJG7QsoqdiLxuAKT49fs7fTbIzA99ZCabxHp7x2LLHtqDiLp0KWlhEXRt
         jzWunnHP06VbZRVrw7r15yxpsUN+ohIoW+2jyaSrvrDn2L054VeY9M/jG4KW6lnTgquo
         s+MzmztFVpXICqtnpaJz04SCjvf+sHB+iZjBiVhrVOHakLuDIhEyqgyfdahe6CHgkHD5
         g6db38/jacnBnh5nRpPAlHP2Lc7/x5DfHxJkSHFPpjuIzrRAHLQ9wxUHhfqE4OzQlG1h
         8q08wXWruuDYqeHuCEhVq9s7tZUZ7jbEf3uZhNWI75b/M9+W0hlbglhfzIpctJj0cQ6x
         1Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375145; x=1795979945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsCFnP3ndBaofMImQLbTwSbFB01O6iMTbveJrzxvAyg=;
        b=x5sR0SGH59W2NxxTsLcbK8Gs4XHCBqV+25xoA7195gme3c5LdSXFUyvyudmSPJqXX4
         iSiZOFN/kFocfWNS/SuecJgSwUCGiHHwLgesnmOCK5BMRZFi//CUdjooQwd85Tkhmyb9
         rre2Z2yKz7AqHxNb0uZqEyT13flAyJp3ZX9xqMtLxzbI2dvIrN/I3j7iAdMCB6/xlk8w
         2asfpBk6CQihtxk+mj73DQbQsE6PSZZn5hYCjnv3K1ETlnVmBHw/+KLcU2ijrJrCzBEn
         g3co4E1+XEIav5w7i3UXYnkBmoH8ivRB+1Q8DFBvsl3vr4c6iBAGWpprebw5tFcusCae
         qy5w==
X-Forwarded-Encrypted: i=1; AL+hErFd6CiMWuQu5pWop+ytK1V85tOoyS4nC4ZqNIBe/OD5/WJjI1WQpJ2hnzC4wboVFvl6Z7XpTt2z7AkQ6cc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GGvO5X9XD8RqaTVfVnHLRPYQLBl7H34HfTc/J8YQ6LA1j4SGs
	ocR6Dkzerua+e0leNDopCNRICXMUeQlqnh0UFI6WRhZz/+pMNXXYKfYh
X-Gm-Gg: AZFdTZeuyQlQ/vreWGV3n1F88SKZcu+z/2BR4ndvjN8RltGMYTVuHE/z0Htl5a6dwCA
	l49rviTFRzntv/EJWLk5mTlgMTY9BaKveZCSGqGanoew/Dub17mhMCCh42DoV10LQiXFuh9zgGC
	Dqz7IeEFeqx2oQUgCEIru0C4zX4Ip4CK7L7s7ZwhWv+G+FRm2rLEbSC+zuQJn+5IddskChka+88
	3/+7Bf7lfkaeccRwRcs792javvZ2bzOYhDJXzv9zagCzWozWfo8KboMYPfc8Rww1oHIPbCeXJXQ
	59UKnSY9o+rvu+Mqf9+pFylkIxRvmRTbYXXTeeqpmM1YemdEU8Hg03bwIMhg/gPHPeLpthZYuKR
	qcAZoVX2gepmN+AyZouxPeAk5cmQORnh8UeRGbulA27hulh5TvY4RrXzSGL/XWHRLc79Ym/lnCI
	XZp+0VOpO334ocb/oeRxgYaN6+AlwIvHqkIAQuY7GP9BXAQFXsJtWdUdYbeyCGKyRHa6WzGRoRq
	8NOrr6WhgoUSMBi1ySGrnO54yT+438bYWuY0Vs4BioSTeGdvL1eKh6j9bswllLkyIa0CBXjbzlV
	BFYcuwbBQ6TSDtt96Gr3yIREKhfLV4IYdELsQZAJU9wz
X-Received: by 2002:adf:e00f:0:10b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-4abb0e4716cmr13169170f8f.10.1795375144988;
        Sun, 22 Nov 2026 11:19:04 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm14926556f8f.46.2026.11.22.11.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:03 -0800 (PST)
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
Subject: Re: [PATCH v5 2/7] riscv: dts: eswin: add clock generator for EIC7700 SoC
Date: Sun, 22 Nov 2026 19:19:02 +0000
Message-ID: <20261122191902.2183925-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-3-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-3-pinkesh.vaghela@einfochips.com>
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

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3,
with clk_ignore_unused (without it the board hangs; that is in the
clock driver, not this patch). Details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
