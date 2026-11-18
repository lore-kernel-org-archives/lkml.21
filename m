Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998083;
	b=aYUYVC2qR8v9tejrDQa/7R4JTx6QPSd14KdF2EFvZlidjCX3oEkkLPu3Cr0HSU/xtkKr
	 4YR0DcKdjsEEFaSr/uPiMb9mZBzG09hkCsHL4sbLmmabVEonn4BJwxcLYV3cRY+mzGc4T
	 v8z29erW0G9aSuzY7UHXjDbuhR8veDp2oMSfchgYYK8RbgOV3jOfcvR9TwxImJzN2WyKX
	 9kjug2YzkULvp+bGkp/pmWoXRpVlJ1faRQbJe00mu68SK5jbD1Bgwi8JggkdAbQ6QNOBC
	 X8eboNesWcS3op571Go9jWsdxeocxMQsuy/Ga/My5mbxS0FujN2TvBKKPWcR6/Rtk4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=VbnsRzldWLp5RM4Wbi+k8602uEkMWd5FOiwEB3P+mX0=;
	b=UJXayeAB684X0vjv6fKiP1/Klfe/oDLSRZA55IRI5J3LTqZb815Bvi3X2UJeEd/h/S2t
	 9Pk5Ph8ngbLOF9p16YIoolIK5Jdus+70AqyRkopwmaidIjtITMLk+UUCiZ6T9ZtkSaflT
	 JjLdVkc365cbBkluRZWG/ZbuO+EIzYiSiPAGqF6FVxhCZUZbvsXf/3cozZCGz/qXQWEkr
	 ++2mgogGmOYRX0FqzhXWUMrdVeHamMQtLvLZ/U2BwDpGeGvvOOKO/NAZ2Ws1348R3zsMY
	 xySQJwB4YTG16iKqGASz87EdTwXVUy9TnUVXvdIDoCuF6um7oMq9JQy8e4acUKfa0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHSgmB1S;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9D3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D9D3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHSgmB1S
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ea19bc317dso4483005ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998082; x=1795602882; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbnsRzldWLp5RM4Wbi+k8602uEkMWd5FOiwEB3P+mX0=;
        b=vHSgmB1Sqri16VOjFa52nle4oBoL1huDI5o16j4N/ezvHlAX1vF9XwXW11d0OCDrT0
         UqhOMGSpJ1iwRmySvG2Oak/RtJ5ostfSprZ/elPfwyKctxcr+FcU8UtYZykZMvhW7yMQ
         SxEso7ul9kjyHj5RCP570KQBQtY+gQzQ/sRDhDAYgeR+I7bXkNL/P6JWkQDZ2jcsx2AX
         OTerDwT9mln8penuuNUGFwvSaWINWZ7C6bdAj3Lvjq+KuzjaDupE15miN0Skr/WfeVkO
         Recyq+bCZojHo5XtNPXirj0NGl81BPd4bkPm+DTTYCNecnbX14rwcVUUCZry++OH7GL2
         3vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998082; x=1795602882;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbnsRzldWLp5RM4Wbi+k8602uEkMWd5FOiwEB3P+mX0=;
        b=vOzzK7sCh/XEk1L+rDlUyfnpdJ2OGWGJ11aqfvPVtuBFrlftj06xOTLsqc+VqI4BmC
         3+ce/xS+1MRxaCTOyFyetJ/7+FJs92SewYL0TWm74JnN2Pbt7kcm7b+RT5TkHoLipLGr
         iB4IsZTGZbpEcjq7TD5b+5Z0M3qq32qQNo72nIOPCjVqLPRhtCpiLTsmwlBvhw/NwaU1
         7J3yQq9ejSWWWo3GrvlI5jd93zHgOCSCGNjQ9Drsd9OLZ6JX/PQVqcvTkRLrZvO/Kimv
         J3laB5XH/eZudCnGtKHK4n0LPvBfPFjUY2zAImICbHRtH5qvfIJWJzYn5sEldjCQS69Z
         Aj+g==
X-Forwarded-Encrypted: i=1; AL+hErGYpyN/CQH9x9fAe3j9iHdMoH8jmn+ZpB8/OQ8PDCDEmKB2zUS30mlyH5ScG3xIsIcUcjwEIhhd3XEFSQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qN0eSTFBMiZmpgH6SrK1auwt6M7Nz+5Q1J83chGoSE3texx9r
	TUkJ9gU4Tu6eP+VwWNvZSjxR1ZaPh4WC4dT4RG7wcNKVlJXSa5w6fl3L
X-Gm-Gg: AZFdTZdH9WeJBPwU2yICIT+k19AUGomIQztos8rd57F+wjk06yCKbzgfTL2aArYu0cN
	rOG4by695s5j+AhbHVW0PbgfUhH3k3HH0/8nbcPbe+CxX2/lAqs+B6EdT9V1MSecblOxxSa6JCT
	LFeJ0faCsuZpwqd1ul3lB8J4FlijEkqYmsnpAasQjJrPL8Iw9qAurDHeUSty+zLMecxDbyo2hFw
	Edy72NWQ8WSs1QuhVOWmMEjuWnMca1t553Lb6fRem8PyJ+Sa6Rd51SEIDLkoeqevpHME7As+cyq
	65Mgud/Br9dDZkL4sFMTrhxeZQZ9AtHWv/2YeKwHHbjVDOnkjrgwZO/apYx9SYOOMOb3+6QHkyr
	ICB3iv0TdQkhQSMqnkc0d+KUUAmA9O/NqvM9ZvHUZNpYWRoTXtBOSZCt6rolT/Q8rGSoSVd8yki
	RBFNQNn1MkeJsRENaZKxJNtPa0fN8c0+8tdsChwmiRM9ICj8oTKEOmskUhzKvRUUzC83mnXItao
	QQXFcTcusV+o5RsZUkLbyMGDBVBAxz6G6wT3bgo20gj6TDnUkVj10RD105wmE7sEbcgxrAgs/ga
	TuobNntvda8/1HkXMSPM6Ky7Asa1IEUR2pJnSM9kjc0GgXOdae4mBMr/2ZF5PWLOU5WPNY42u8i
	8hX0cJ9oCtUs0Ooywt0a1tLxMt14oB6088MpWEfeNd74OKM+Dpz4YVprffN+S8SYHfDVpQsYOQ+
	S+KSf/8Zal
X-Received: by 2002:a17:903:1ae4:b0:2e9:6333:fbb7 with SMTP id d9443c01a7336-2eff756dd79mr21077005ad.51.1794998082258;
        Wed, 18 Nov 2026 02:34:42 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6184152sm10914405ad.35.2026.11.18.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:34:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] mm/damon/tests/core-kunit: add test for
 damon_call()
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 21:30:04 +1100
Message-Id: <179499780488.5.13594313574604410531.b4-reply@b4>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: damon@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, sj@kernel.org
In-Reply-To: <20261118063755.37749-1-saileshnandanavanam@gmail.com>
References: <20261118063755.37749-1-saileshnandanavanam@gmail.com>
X-Mailer: b4 0.16.0

Hi Sailesh,

On Wed, 18 Nov 2026 12:07:55 +0530 Sailesh Nandanavanam wrote:

> Add a kunit test for the two cases.

Make sense. Thanks :)

Tested v2 on x86-64 QEMU with v7.4-rc3 as the base. All DAMON KUnit
tests passed.

Tested-by: Aveline Noir <jm5905938@gmail.com>
Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
