Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408172;
	b=Cz0KdLyL4qKzOiPDmVdoqjKcRS6Xl8PZp8lKynwObMGeloNBGnZGrl9SGgNpmAuyvL4a
	 RbT5PN9g5EXhU68gE5tRDFkzWycgfe625NOToHN/OaJ8uWkJQenk6cEh7DIXfM8+zXVpe
	 XpN3HvJnMDWR4mbWmEhdMo6yBgIH3xaY8+0mT0KFA+WtcmjVzeWuUXuERxRx4tkYe3PMk
	 rSTcBFCmWoF9hrpM8NU2ydKa+GYVpoN8o7CjK90uDhhNL0Aw+UsAnmeqvAvJB5T1Ni/4V
	 EzmP1olHSRftiZZtl9awlXWTq2ptZZjk2gZELQVyYsS4cXxMnJZv4q+KM19LFvG2EmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=BGWy1pjF8M7tvt0E1vHaI6fHDpcMXUISfZ4Pwpf8MNk=;
	b=lso/IWZB6+VpxiO2Tw8GAzmhDsuv84+MK14TgpCr/xJaJ0EJM63vMVbeklSQIpZohrgg
	 HqE9kySByS4vWueeq9MLG63taa3dzT1E6Rp3HbpRdOURxMhohVKHcGDpz47Ob6xcUH34S
	 AWJ+wXSQ4jsKLpkfgIbu2DXssTVvfaAwjMCV7+LbH9SVNXaPr4VLWUgHP5ZUGD/m+qGZn
	 czkfPjMrFCp5YmuAbgJ0ySWSXnJF7AKh9vUm9MiX+jAJyRADX8lPQDktDyptk4x4QbF7P
	 EPb5simRdKP5hNToKrU6bLlhIgvheUBHBTp9iyBzHwtL3iOm34pC7yuNHgCT0gE9Rbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycAU7qou;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycAU7qou
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3446970c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408171; x=1796012971; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BGWy1pjF8M7tvt0E1vHaI6fHDpcMXUISfZ4Pwpf8MNk=;
        b=ycAU7qouECyNA9bMClDxuXfr6DZs0g1Sf2Pg0WrrDqUMPpsrTt/AQugiJXguy/X6em
         YW18LdBkW5AU7bkwlnHDdoLydhAxBt5ZVBhH3J6M2zbpPx96pGIzvZfz84LmtBp9KBcm
         cMrjl3PTPjG3K2bOf2hIZ42LwvrFfZK+mRwYr0Uhk/KOiaTfsgjIc0gyrGmlhyuUTLEG
         nt6HvTPEHr3VBdL3jSX4ln6VUpLDsDwHOEzI0JNGbx5dL1RDpuPnOnSsVQg0rhsQEBkr
         K3AKQa4Qfs/SspzV02Gy6iI3lFlQqPsG/hYkoRmYOnoedIQtukVJMFi62OIBfH94kbtM
         +iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408171; x=1796012971;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGWy1pjF8M7tvt0E1vHaI6fHDpcMXUISfZ4Pwpf8MNk=;
        b=LCYz8CtoAmJK+kN45UccYOR2SkwbROWLcnudEFisZSqDECPv7jXQysJEQrPk4bFvwh
         hjCaX0FjioLCao31JGn0V3HYzoUyCKGaqb4LW90CseKQVFOFaCPJjMo4sfgPpidTD5lb
         ZSn/uf7lEapms7F6cs178ex/zjUDWmyA/j8MC09gVJr3q8BDdn1lx3T27+b1v3YNCd1/
         D0SS4gUkCzPyN38tVWN24Srw3guScCS+qNnyIlr67Z9PQZBSfJzFwlZOrJzm9Vv4dFA7
         1RNBi7S8choTiYvoCNW6ITwnP4hk1p8nqhr8/ubfwxjiCH6am+MdEiv9Sh5EuT4nxVoG
         lwSA==
X-Forwarded-Encrypted: i=1; AL+hErEwClGhi9MMPyK/QtiuSKIyPo7qhRIvjGamIIv6N62E+HTX5+Qzzvtmul5ST64Tmq6xeqgdn0RG0mIbNKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o8U3+v+y/eZETxBDXQRgnpFEcQSctqYtsTpfqZVYmDfCEqHl3
	ZhlklKlu74agy9KiUG2N66175ZZPeomV9PcwFDlTyRkleCYdA0239MgxlePB+6Ly
X-Gm-Gg: AZFdTZc/zdfU7FlSdfbGkGhoHf4FeAZ5Bqd2ZIlLvoPY+EQ8NCNNLqEVxb/L9osE0FP
	05IsOQ33TnzvU9VAAbf7/gFfs5AsVJFv43sDGUqwSBMGyaspmwYFkUymtxF6W0bEmfoh0dfkZWH
	RVQS3lezpvvEZZjTYbFwv7rZdWDfa61PMaBhqxd6YOa//Xv2TUQZ/WZYa7Z4x1acKVjIGkH50sP
	EdzqDb5tQLMRIHRSUkJ1eHqWKpHa4xx1jRtJ4XNMAvaXgDwLAVRsgViV8HQ4yjPkuUcRZ/VhI+e
	2u5PIowMz8b2xPJPyncSkAoKIkx7IEKPsgTDWcUu1nMcMBWHHDbdWA4g8T3uz6ksst8kBwydaH2
	J5AHzxxtTAjA58rRvA4bNXfHFlX2FbagwC3PrRdSp8rjJUg6VgcyoJroQTbJjwbTo1nBQ0L3EwF
	Rh0kR723PA94UvX4Q+nLs4eigsLqGGr1NTD7Y3Z5k+gj5ePjnxFFnR1aRxR30Yy0DM3YRG9NHgK
	qYc5ik88wi/3dRMge1mXP7QDeV62396+d+yWUkKM41aUVM8URxho3bBopExgC4w5L4bh0E=
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr12148980c88.32.1795408170982;
        Sun, 22 Nov 2026 20:29:30 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm39902948c88.9.2026.11.22.20.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:30 -0800 (PST)
Date: Sun, 22 Nov 2026 20:29:30 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change its type
In-Reply-To: <20261123032537.GE10218@Liu-laptop>
References: <179535729502.2645501.5219010464870440@gmail.com>
 <179535729502.2645501.271186140389290426@gmail.com>
 <20261123032537.GE10218@Liu-laptop>
Message-ID: <179540710966.3093990.1416762538136490909@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 23, 2026 at 11:25:37AM +0800, Hangbin Liu wrote:
> Hmm, I personally prefer the approach used by vlan and team, which disallows
> changing the slave type after enslavement. If you think we should only disable
> the 802.3ad-specific part, this change should be merged with patch 1, as they
> address the same issue.

For net I would keep it to 802.3ad, where the type change leads to the
out-of-bounds read, and merge it into patch 1 as you suggest. Refusing
the type change in every mode would also make the enslave of the nlmon
device in bond-eth-type-change.sh fail. The test would still pass, as
it does not check that enslave, but it would no longer change the type
it is there to test, so that change seems better made in net-next.

Nikolay, would you rather have the general check?

I will send v4 with the two patches merged once this is settled.

Thanks,
Kyuwon Cho
