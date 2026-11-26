Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699836;
	b=QN/5mvHJkkuF5KvtZel8AX+8zOSju3xphZLuKB1n2Jpw1v15Y+z1o6njbGZCRY/u+GTH
	 M7qAnwfIPt7VdIhQDQJ3z7XluuQft04t2M/PnzUNmebGMUet29Qgz+XhmYyVMWHeJNdns
	 wz35coZMSiBuqaDm7DwcY+efYlOHcdJzkVV9WKZebQX5crzUDmdvG8MjlzfsOv13L4Knc
	 uyDx4ZNlyyBgkisCtW+ovyBnv6G8jFU+XJ5eYpg99wp/QEs6+Nanx6gx2JYy4kRKKwMIh
	 yHtd6lfxGPf5BRNp2pi3IhRVienrn/OVinlICYhmdo528evRqz1xgLI/qLrXYq+wWNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
	b=MNbL8IKA3A0iSaYAX6VrY30FtBlwTGAPTMILGuy9KM6GEN/iTpjWqsqJqTO5YvOOnzv9
	 LqsSGgfN0F6qccwuGnO8/yIxl8eWJhFyqZn9lNU/XNlygXFYXY/e9zkFpm8eQzwSAuZIN
	 iQa8m73n1zgUl6Rmvs4ykSovh1H5cxao4XlvXwmhHpyir3wuPuv/L61lzrIT6iiIOK68G
	 0hZMrNihpH4obitpcv8KFhYU9OsVveOjydRx8MYYIgJj24C5cPpPpH/yUBx8KSDR/Ti6p
	 aEkRFQfhpPI6yXQ4XyQpB+buP03aPMVhh1kB7daJ41GHlH84zbMMPC8AYHj7SPHj3Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iz8oGwyO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56835606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56835606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iz8oGwyO
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14873137eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:30:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699835; cv=none;
        d=google.com; s=arc-20260327;
        b=INigs2awEYvin19gqDnSpXo9tfNIzrORwKTO+OJcGV5pa9T1CUnBGI1OseyWdqwVa/
         aw8FKETFyCI7Dr9NOkI8zTgnB8p3dKqMLzwx0MEEAfvekDj9w+AKWi+KxQ0L3S0+33Oe
         0d3LIL22QuSY4O5gpJuMmTaH9BWDfEiOYiNhURhRsAvRDd/I41mLC6vFvaYyhsdz+Cl/
         RwA2pYh8WVAbhqQLdiVX38OV543yTkvMe8GAvsP4OvN9wgjKijbwn4AC1agZETR8JLcb
         hYKT5SUom/tCnOl4BUl+xeW4mdJcya1nZ72UryayXDhuI0qSHLrP04omNTUOTZBPjURh
         WbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        fh=sJhw8QvSRu5l9HhjTDT//puXFmEvBv9Do7RmTVpVtPM=;
        b=QPKSh8qt8rPO7aA7UxoQd+AwCdBLF9VXsWINPIw26eYQomaMHN9IKMOGo2OnpZ+nWa
         UTS7i7RjVV1NflEMF7wEA/DfWtiwNKdAEXebinkZiOBXgJIQaUPiKt+9DjlT84QLAgHz
         ix98F1KCItICe4Jflo5+6tA6MNSErEYYmBx7mxBXIZJZv7luGykkaT+V464qw8bybIM9
         wRuey2pbFnrs59dl66g0kGofm+o19ElWRRxHeMcIrcqIM0pJ0tCNRbTc0SAXD01UUfzN
         ICZEqXOmfDBScV5d72DIIY011Qq1PcNRL26nAwpN6dNbBqlXk7yxtl2h/wOXvdUA0Jb/
         aN0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699835; x=1796304635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        b=iz8oGwyOO09o4i5dWB91D4ghISsBxmFjH2tehPipI789M9ucTYLpa7LONDMVVl6ICL
         v6QuocHdAeNYP9nvTFW9XIXOBgQGaueGU2YlbdDOPj5vcjRZgbC8tm3zZxQ9omvYcXDi
         xB1pI6bJGoMuTKu37WkNP4tGErBsJVIZnBjisgqpvYrk/cF7dCP66d56rMov1NMAvlKM
         h85ENOl4S8WOzUZMZUA0MCIy5oGQ0AyLFlKk+AK1WfOvUS1/jSUjI/8rI33VxjXZ+mc3
         EAY74D0kL7j3CP0Z/HH5p80XtoxuTKyA6lmTbLid4SC68C1wk5YyGkNvgeHQVoZm6sd8
         b7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699835; x=1796304635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        b=b2HQBlcwzOC+6s5tLA+vWO0MPGvD2jVVPLxFjnNZBA89yZnIYuP/vONvwTDwyuAFE9
         LcRnAZZ4Sdayyox7Y1DbA5vpdXiyn6jxMWhfILkKFDV+/sgKsy8PE8UYw+HoWfetm0/X
         eWglN6X6VbFexXc4uoQqoyEN8c/Se/OWy4y9EFal70n8edmwK9Bcz6YYalptTWC7eDIc
         XFVEAiwjQGYCx6CiGtcCtofswGNPoR+5e43xNyReC/HDVkYkwXZ4apyca2BiDJbLSMZu
         LqSn6ltfXB3eJ/yD6blcKnQtCquas8+3txzz+TbIDe1i0LlphVAQKFRd6feN2dluflot
         3Wxw==
X-Forwarded-Encrypted: i=1; AL+hErGGGMDyUhgC+bI60Nm+askEGUdXLrF41Y7Dj34SC0G3e5zenDtk2r/W1Pwl8//fVipEVVsRJUjNXvoA9e0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rDl9Gfyz6ROTscfYE73+xJqrdTXXqv1/PNm3hd7tUOafOrFkw
	8M9jLigfpyhTg6Yp4QY1PPD4avMNGBuYT2nmu1M5txL/z+Mp8AgOh4dDDAiYBub1Nu3pZ3HPI1w
	HcmMa1l5oVOd4pCikUQ0Y/iS4pAQ0TXWmqYzQ
X-Gm-Gg: AZFdTZdsBzrvUpk2+gLYQ8VtbhWf4XBJXk6BMMcKZlAIrj9sH3iyvnG5w5yNK9noAYi
	qbH2S2o+U2Qu+3+dFyfwyAr/Y6DcrobzflpD+wRJGg7lM8fXLeBpDsk3JIh2Ie9PX123hcQbr7V
	7raxvILnzYLGrE0l6l9IfFxrsgxOyV4xrPR9nQbRSxKG+iEda2qnA7Ls/8shU8lGO+pFLf21u0l
	RzW4U8gOWN7QGlriM+vZWsXwUpNads7lEHDF4+Cgw7o6pLB+pZhzvvpK08Ckh/ysrLwAv4qF4YP
	IHkXpKjXiZ+rnC7+My9/JnGBiRqWLYG2BSohhX0LHOA65KgMEbtcpk8wYxzeK/QOLYv+ac2woOH
	iRkrCjRowjbaBDzFh7N32YJxHmzgX8SpdqQZNqsOz4CQJ64B1yz48S+1M89XkV0Lw6Uof9+uiIr
	MOTyOq+VXTX/g0THd3kds5Fgq4SAq+uzhAKOXG5W7S8c0X2tJivPI=
X-Received: by 2002:a05:7300:4721:b0:386:da66:671f with SMTP id
 5a478bee46e88-386da66762cmr2781680eec.28.1795699835188; Thu, 26 Nov 2026
 05:30:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115090520.102216-1-clamor95@gmail.com> <20261115090520.102216-2-clamor95@gmail.com>
 <0670d537-0f9a-43dd-9d48-90272f04f1e2@sirena.org.uk> <20261126122936.GH38590@joneslee-macbookpro.roam.internal>
 <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
In-Reply-To: <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 15:30:22 +0200
X-Gm-Features: Aa3M54phpO9TY-BjFhMXHRwC2_FlICHLesKqjIioZHRgOyOaeZaLBv9530oQbas
Message-ID: <CAPVz0n3tpcEteSfU+51_FeJaYYMwz522h968nWHSw2gz6+336g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document
 LED support
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:2=
4 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 26, 2026 at 12:29:36PM +0000, Lee Jones wrote:
> > On Sun, 15 Nov 2026, Mark Brown wrote:
> >
> > > On Sun, Nov 15, 2026 at 11:05:18AM +0200, Svyatoslav Ryhel wrote:
> > > > The Maxim MAX8907 PMIC supports a single LED; document it.
> > >
> > > Acked-by: Mark Brown <broonie@kernel.org>
> >
> > You should just apply this, I think.
>
> Well, it doesn't apply so...  :/

Obviously, Lee did not pick up
https://lore.kernel.org/lkml/20261123150224.199601-1-clamor95@gmail.com/
