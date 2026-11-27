Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774972;
	b=Ecy+UYtyGe+94ExDPb9x5aR/vHfH8D2yUJOxDq3guD+7FpxnaW6MumVCp0QScymjIgpu
	 3BWy8OL+QwPpQ2NbKcYlPquidHh7wd0w11HShgcDAQusC6ecRSm2DbSBHTJ0nTkfcS01o
	 UlJcc0zoJQ4thlF2Asft3wgXghYs3EirC0tAevJ9xNLLBj/Q4haHF4sWTcpBa++P543eU
	 s6wUOC6aY9VnPShhWHSv298NO7J+9In2A+gSpciIZPlHLhZUZaBtwC5FSZMMwEyo5iw8l
	 rdkqRm5fih07VhPgHYtLJzCPRlDAMNYN7GPXXReicfy9z7Gv5A4nq5p298rIUV6TKqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
	b=Ej0/fgohkb7EgDjtiGQNzNOkR6tTlw/kOOeMrSZgkhrUMD54ix++RDKvNV25mFRbaicz
	 38XoLgQPzrbQ/xjERBeJIPz9XyunJ00mAkerijc5AesTznK4jqhm6iBbjz1PeSNmi4bbZ
	 G0wnwZYo8SDGCV6+qu5DYPxsHJkxO+nm1GvVr+mdx3fAl2wWJQ4+Arjmd3ERW7tAI40rI
	 RSVaCyB1BuiOXiN95qUZ/FhfZGKdFFZOjnBfClCH43gnfz+tooz9Vzhw6JDrCDlMyZw5B
	 q2QDnL6H10hjFyx7uJ35VEKbDpdhvZroaTN8LS0ACaz9Qznil0qNgTErhRi0h45czaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEsMUJr6;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF31606A6B2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF31606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEsMUJr6
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1289686166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774970; x=1796379770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
        b=pEsMUJr6wshyFZk9mSg9Q5aVI2hbLthWoh4EaFjx0AVrRXI+GMhL6cHAtiy5w3a1be
         XDFPG0+WH+n+c0BBOkCe+Vvt/F6CbykVNqo35ztzH43l3HSuKkg4xHhv2R7A/leDOkbo
         A4Smycbj8nJcb5c+Q8nNrt+zzg+CFR2dMHk8b4Ql+y/FAvNAy3oRX6OWz5aIa4uIkDMC
         xXrOtXYi+FE9kYyoNGj781TgU/DSE1Jotk282tt4reseJcYHJiLrmQ7c+2RayYIlse6/
         8JCGRCGMbQc4B/Wx7RR7nJKxdyI/i2+cNT35Zol4NyZzsw8xzXiKOvE+T3RpSbnPz3EG
         kkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774970; x=1796379770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
        b=uHCCmWbKdEEgCOEvAoyH6TzAqx6Ul3yLe9o62mO1SgdEqROYujeLgGuzGm0Plz0deo
         WmmOxEFMExENvhHJTUypt3aKD3fQ4FvpXREXfLtSIrnt2/ASp6HtJA8MG/zzDHd/RygA
         fhuUJk4ilmpuJ8eX2PgkR14blso6/nqTBuzrYEtnAlamnvZctNWx0Yf0dIj/F4ex753M
         sXsxFnQoxJ8gm/ffvGBybsyi2mnqogGv1itKloeVgZjoXptNzHBir7Jy3LPhjgOqXKrb
         ZUvwuqOeJ6VwS835nVed4GvxwdmLKKE371m5iH76jl8HdwcdQCihlmoTYDJhfx50eb8H
         fdhg==
X-Forwarded-Encrypted: i=1; AL+hErHZ5JvUYpwle1msO5OVLixplt09VKXLmKU+0KjPWPZR7VnOz9nAcZuACOkuNCwizjXwWiGo7tvfxvKXOH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BgozLjGumc0hjJeEs/AAqf5tkNxbzGYyMwm/cRKdU+xFgQbXp
	Uf4JCTq+iVA+XZiJO3N8AhivLjnBRM9PaI7F4xknSOfNP0pgOAb8P3HS
X-Gm-Gg: AZFdTZcQekpZqaKQK4i9FBrl9klnGj1pB0hEt46b8Kqj0GHKhekdUawcGUxVEqBw/gK
	VjFm7uO8m4BdAworj8W+44u1FS1T9yymSo0SNNnZwOYcSrWgb83ApaGY/e5WVwN5uk/6ql/evU6
	Yy5Hjo7RHWhY4n9Jdlikqsr1nuNa4+KjBv80v9h9MSqBd+YvFjGv6R5X8o5FO2W0Ri8xB5pGELD
	zUFocyo4SVLxfZgnQPGI22qWsOpfr5ijetLNuJb8D2q2H6moqrWyLGa9VzAxuoDaEck5cT2vhki
	h4wBwb6hQ7jTyU+6Q1pdKWoV6o9gpKsZyockQnwOzasNX0VQwsPOwoJhC08CWIc2spKpKW8lrKx
	otkHTFw9gC13uef0yZab3X5rzXZUwlRAsKTWFd8hHr4rwR96y99B8MXbe2J9wo8EvA7cWX/YzxT
	JArS42P5M19Lj8O9zpfatpeF1GTEGVYMbQe23nx56FIUxQHAuM3Jb/KF6uEdKSG3Zj2P3arqZ6y
	7DqiLDPjqXJXbrusNbxP6HvY0g8f5oYxAbqM61uYokKrTdltFyxy7gsjawQ1+x32TH0B8XlFog2
	hPmlnMmWmwXXTOfBo91jcBhBcpj1iqhNctBTjkepBgQHKXBLnw==
X-Received: by 2002:a17:907:3d0c:b0:c31:c767:adfb with SMTP id a640c23a62f3a-c513a274fc2mr1819372866b.0.1795774969713;
        Fri, 27 Nov 2026 02:22:49 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm895871166b.6.2026.11.27.02.22.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:49 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] wireguard: free queued packets on peer removal, and test it
Date: Fri, 27 Nov 2026 12:22:48 +0200
Message-ID: <20261127102248.49457-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179568676064.3294.9567118397760540141@kernel.org>
References: <20261126094722.73025-1-apasichnik9@gmail.com> <179568676064.3294.9567118397760540141@kernel.org>
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

netdev-bot+sinfo@kernel.org wrote:
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The leak was hit on a single-CPU MIPS router (Realtek RTL8196E) in
everyday use as a WireGuard gateway, and then reproduced with the
WireGuard selftest VM. v3 says so in the commit message of patch 1.

Thanks,
Andrii
