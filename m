Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.200
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795588326;
	b=QDQbuCuAw5vFjKsl32uCVigqbMySXAcEZejLE4XoUp0FK8KD37pUhJ4zFnjVYuA57cdZ
	 OX68Qhtlnl0HpAJj8Jn0SOYPqzGZbJ0YXcd9VdtPj8wpckmskrS6+bJeOTKtPFdV5H+K1
	 gjLwkG3+Ecq0wFW7UeymEXd2uzxwbMcSfsaurB3KOKBHh6vVo+TBCMXZx3IPrwM91bXyq
	 TStUfHJnYYztlToGezgReQcPUDJ6QbRZPFX7JZgXS0+CeuGJz27OidIl/wYxp+pN8bn4G
	 29cTI5gNxaYpk5ila15X4FrklzEZ0CZ0kl3Thx3fkVQE3XBaACTILrbinRjlKMenSpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+mF1WcvHj8pRL5/pxPkCphpKhRYTEeKXsajqKsjUS0U=;
	b=UOdAsgOyLcsWro0IiBN350zAGJYVqtlC+PuO2DIeNTDUQtI27wzsowNbFqT6sTdEpnX5
	 54JT2FEuNY1yaOCSkvtPcdsyCvRPj9XWcUdldndRCs7R7En6D++KF0w/IHt7cXOK1TF6i
	 ee1G28bsuId4qrlyvruX2NeDdzC9+ygVkpmFVwCwmG8KeSYijdKgsy6TUarfByTbLxPTm
	 XeW6LQpEmXa9Z9PPzkOKqCbdhR4o55dC3v9bkwzEW1MN5d0XP7N/HONC8ITABSp5GdPP2
	 Ji0ul4+yJ9yERdkAqfkD7lCgtD3erpPOLRcY5u+xeK7/RsmA4bTyrMJk7DGRWMgkngA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIEfGxAp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458F7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 458F7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIEfGxAp
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-51cddc2451aso1522257b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795588325; cv=none;
        d=google.com; s=arc-20260327;
        b=BIh+ZPcuUpkBtfH4MK6mLoiiayxZVsv7ewqeYNBIwUkN68azMbzvTLgLb6oot5JuPy
         /BoDERStSOcXLCRJ3J27gBX4LyZoU4JdRU6OsBS0p/5zfCMnSllUgSranLrTeLYmXTU0
         fUTcOqCmpRF1M2qT3XNY8xueUgjhoUoosPba4y6unbmXEizOo/y9vCk6TtQ/5fhxycds
         yVuN8bwVoNRzHD72jmooBf4snlbyD2JwxpsnksZ26t5pJ5drBfaNpkaETbKl+zy1JX4Z
         xoDsjKOHfYmbLwCalmk5kQAH+ZP8Za+rr3Ixp9Y89JDJKbSJo5R1xOIf61UNoZHngK0y
         tvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+mF1WcvHj8pRL5/pxPkCphpKhRYTEeKXsajqKsjUS0U=;
        fh=rL0Ap9KrwERfhtmqaKLUgi5tl+UcYdX91VyFQGISb9o=;
        b=Cc6l5EX883M/76uhM3CQjSBSyiCotuJBI1DfO+J4xrbmI6f6GKx7ZSbwGRpVwZMaod
         FQ8odxc19IAJgj4JScsaJGV9qpvKc9mUH0x/ruJzfcPdceLAAOCWje6OS16qCOf0fOZk
         AA9Zx60qFGBH3o3OyUYa+Dzxx8ncTymUdozWYgeIKmTR/zpVsv0qObpJ1lTXrzvq3ACk
         +gNlwGF7CsSOOdWHF5uczZosj9TE8sJSY86Ruue+QqL+8LA2uWunYqdLxpfPwxLRqLg+
         6VfTkwWLvbtWI3Y2zb2uyuKyut8I+YC7l+eXwBsdowNWFvP5vrhVyNdlyKvYISVl7Syk
         zlYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795588325; x=1796193125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mF1WcvHj8pRL5/pxPkCphpKhRYTEeKXsajqKsjUS0U=;
        b=IIEfGxApDoyLixoJfhMcsQd48vazhOSfD/9UWMXG0UFJp7iQ9IsDfq3bA9lXxNcxZP
         ie8cwIVS/0QKrjw5qVhziGD+mhhJ6EfKGaQ7RmNts/kJ2TUXb+e7jF7Gtd6LayMXE1Wq
         Yl5sBkAqHPmKLxWjvjLWiTtsLHc+9a2s1TFN70MO254+3Xc/i+K/qEHMUN1wGM3mFzbB
         NOqPgt/9pFUgfs8P/wYjmcIhOoDl61oWHMsaxDynZfRkR81n9grKuX+4Q0jip7CJHWOe
         PL1bmrThnYHxXkEtiav6RvZntpH2wi6ZZnoWKAMGM84ReZ3yCwQNlVuiAj1Pdur578/V
         PcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795588325; x=1796193125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+mF1WcvHj8pRL5/pxPkCphpKhRYTEeKXsajqKsjUS0U=;
        b=R4feMGdvNT08+MzpXZX034VIMlJxi9Vu0AYxRYcZaaTt6vY7R5xaJ8i3/+7ylDKlin
         2TzxHKP/wDtHTh5R+vKNWLyQpJUAvmk5F1V331CrqOISe/maMWg46QUP9oY8UtHMVgoL
         3UJkZewYM9d117Z9ponnXXawtTD4NvEviaqgbCEm5awIPT3LhWHtQABIybmW9fLCLe4Y
         /49VCgkPH5vkPfV6zT98nqG6rdlkVSfMKXMD+qYemy3dAUEDcOi077zSlEtgEwE5mb5t
         h6minW3s8hmM2beP/o9gCZVPFtuyVRL1nb6FGJMvrPZ66styXhI25rf5TsmeemWF5hvh
         iCYA==
X-Forwarded-Encrypted: i=1; AL+hErEM69wjeu7G05ps1wlFCd+ouKmibaqE9wHWXLAX8ti0NoKhwxKLuGUPhJmddQCfpCKI79cZHaBCbqP73nQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FPM0iVaKpqKOb2ZgrLJw/xKYU0X9TxDPCi03qRfsMZaX1DrC2
	XgyMow/qVhIsMYkNEiGzr672EAfFbysmkVBmUeyB0mDHWYe9vSVYncNyG6DvzSzs//6aoR30AQ0
	8YlM0ZrltxWIg6t7HnxE8NshcJdiwjuU=
X-Gm-Gg: AZFdTZftjVlnO78CJUC6I99keJ6DIrE0fO9Qz6nfYSvhN+LTzcvIcyF23OvjxFLL4Ua
	xuryqvuIokkrZKBW2Fq5Vo52ZzHy1V+dcol+cBCT1k55QKJmgxXDlpHFIBCn6wDV5068K/uuPlZ
	R9K3cN8MujVrH5qtNFT5ajHcwHMzmhCVHjGb0HaW5LY4xepIpXYlAtMkBFn76jT2fXGwNKOtL59
	KSVumiqzRi77e4pox3m7/EDYIdeMEw3dDuKfah2yE1OnmaDYVamwiPMh/t7zNzpQ21a9t83nsxz
	VSzR2Qrf889kokZPlJ7Nmleh3yKHOSTBrzvzVpUuFlBDDBhbdpi+GlMVHpInfh9+g0nqF2TUdc7
	c1E6XmZsE6wFwxoGZRQm+RsoFkVxGTroBT5UphvMlCsPngwKt6ymm+n/Gt6Imhgzxx0kWSnLigx
	y1Oglmjq6eF8QyydNT8AUfyDDRpXr3riHgDHC8+7Pyv0+W1wPV0Fhk
X-Received: by 2002:a05:6808:13d5:b0:572:dc48:b773 with SMTP id
 5614622812f47-57a06b1d9bamr18970591b6e.1.1795588325204; Tue, 24 Nov 2026
 22:32:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123034047.56745-1-dennylin0707@gmail.com> <CAL4WiiovxhEi8G4W9F7faF9COPTaUcjo_1VF2ObJpbUB0i1ibw@mail.gmail.com>
In-Reply-To: <CAL4WiiovxhEi8G4W9F7faF9COPTaUcjo_1VF2ObJpbUB0i1ibw@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 24 Nov 2026 22:31:53 -0800
X-Gm-Features: Aa3M54qpaRoclcSDak6tF-SiaBDwCmzc34LaOBMRn3UgbUwbQsTboEqvA2CXwgU
Message-ID: <CAGEkeHf51H+hrdzWLU=rJtjP-=3zs1vMf6pfZB6p3ww2a+N6HA@mail.gmail.com>
Subject: Re: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments
 on IPv6 listeners
To: Eric Dumazet <edumazet@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	0x7f454c46@gmail.com, fruggeri@arista.com, noureddine@arista.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 1:35 AM Eric Dumazet <edumazet@kernel.org> wrote:
> A follow-up for net-next adding a v4-mapped peer on a dual-stack
> listener case to tools/testing/selftests/net/tcp_ao/rst.c would be
> nice.

Will do. I will send it once this fix is in net-next.
