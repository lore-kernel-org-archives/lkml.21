Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172429;
	b=TRzfDS5H9EDv2WfQQgI+iRW4Z1SzzXSmqKjqp/2+Sq8F59U2I4CwO61B52U/PMaTC6B7
	 7qrqFN/7LSC8pYkUgAG4ZRUGA+j32DJEnkWFvY5dVIr8Rq/aFQP8K9w1F2wuQWZXiFau6
	 uMLC6HDi0aVIKrEQjmyBC/VixTrI13TwOOq3CjYzBZuwh3SJ93YQqKBEHsIPuwhba3Mpw
	 xW7Xg0NNvJgM6YDi0PgfLSFCtgs9GPlPriV6/K3f3mfmFH5kDrPvi0gazCQ1nNNKoYfyq
	 KgA3S0YlDaXdQ8Kj9ZDNE81vPWWWnNHdZnjhJRzSW/qwN8fRKDqfuYqEiWXdA19mXlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172429;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LIOr8EpDe3/dYmsJbUDbEQoYb1h/0cU5uZHFxnrpj+U=;
	b=IxqYdc5XMLOKY1juhxSmCndztA4SjNkBN3eT0cY7RA3n6AoWitgiKg5MI5zvJjZboUec
	 NJKiViH3LaOqUGO7+Yo5poAbOB+Hypc/an7UNN1oQ8T4r4pP3tuEKOHV1ewTPs6zkp6Bo
	 mzv3Ok/2+MPEYydtGuRzJ0AnF+KXRbwCQcuwbSLvk9PlOwUPK4oJwSVgbSdeZjMU/pFZe
	 T3NNRt6uYVJ2+PnnvH/rIRWdj4DhQ/ge7Uwx7gZP8kHd54ieSiBq2wYQb9Y59sPXSGlTU
	 JYk6olYXrYmVciIgWV0S+ryKcXo5o+bzi8clDZ1GBmGJFf4o++2y5SCUWlwF5HTQttQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F4E606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F4E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ee3e658c72so409145e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172427; x=1795777227;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LIOr8EpDe3/dYmsJbUDbEQoYb1h/0cU5uZHFxnrpj+U=;
        b=duyl1tonJjetO0sv7PMrFqgD/dzeudCLuf4rvdc0jqsJkFa83cU+ZdbcqnsHisX+QE
         kMuJ+c5e0mWKyG3j9DiGBzOnwCNrOTzvDwi5kAn3UZZ3lT+jVs9B6kOGejtNXHAJG+SY
         duGGwUrgLwUDE4ku6yV4wQPnmjVy24VjgXaNB+e/IG3d5otA00mDd7TVhkjAMjIiDHiW
         +2qp2Xjc1TvR6jI49Qp3c90RBcEsPv0bG+LasnEaiTbU3GKfdS29kkU7m0/dhvhYbtc4
         K58Ds+KSdNI0oxep53l7eyZQAUon915F3fVrQD7SWeYqMTakvlpq3+qc6g/yl/kpEfqD
         zjdg==
X-Forwarded-Encrypted: i=1; AL+hErGGQj+2qif/Set5d6H2rn1h9Uq0O8r0zmnD7RsEHtYCF4adJkVKteacW8iqw6i374f/S8ntA/uuzrHgs24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JBmRsH4ELdIFdaVpfLUfd3wcXbqT40FKQQ/klSs6G5/JM8Cvc
	kR0teTWwbbkb7Fad1oylD+kGSt9eElIK/R0E+Rz3ySKN3qfYyt5JxxW2J0bjPhus
X-Gm-Gg: AZFdTZcntj6sIVz+FtaGaYP/zSBNDG09EUGMNdIDPwof1tpEPWaorKhzTcGkZDQbCYQ
	AbIQsGoIQKz9oFGtAKDZCnUrGiKK5JXr7K9qbRHQOOXawaZ5LASPt6ijTh7jZS3hWSkbk/FzAYV
	sjeEmM+bnb1zRX8vGTdIQjQk1wUVVYkCPwaK+6n3u/banqvqVvpZlGUxiDni9UA5Yw5B6l5ACRn
	0zqcMX0cDin5TKYFuGmxiBKDjY6EMqAqUQpTfWFOKFQRJ4x3Mv6nJE4blzsdaYmQrNCmPzIb5Lh
	BHzHSDWzY2BITFgZwbvIPK15ICqbaHAvDVUEYDaSZICMvT7+15sdmaDdAH23lqdkFx+42sI+MQq
	tPjJr3qF92+A8BhoLpuqyEYO4IdCTFksPgKMinjudffzdl3tSFWd4nn1b0e39kWje/7NxNPC2/l
	p7+I/8ixWN5367vMObl1Dy3Q6sEgr/77IRBVzhjGchxtlGHXbrnAWbB3y4LfUFgitro60faNtqj
	UvSkZwG6ATRc+x+iYcF+zUEsoJI7tN7WgMguXknA8oUhQqahe35/HFQXcnutH+Pwm7xHsk+Bzpc
	g/bk1fnYWCy57QzdVd/ulTxqQuptqXcHbI5j0cqKUSE/9uin09N6ElFgJCzN+XYp8GAAgmf6ZiD
	XJeVCD6QPj7vq
X-Received: by 2002:a05:6122:e1aa:b0:5ec:b371:ee45 with SMTP id 71dfb90a1353d-5ee8af38b5bmr1241480e0c.16.1795172427593;
        Fri, 20 Nov 2026 03:00:27 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee91a4e0cfsm503735e0c.13.2026.11.20.03.00.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:00:26 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7d6554d96d3so438074137.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:00:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFpwgmsD9ReR1aLei2pwXleb1DRaZzjRfzeC1z/0x78LBg5yFIWxyrpSihRNn7pk5ABkCrv09o1RVS7ON8=@vger.kernel.org
X-Received: by 2002:a05:6102:6047:b0:7a1:f7d2:e82a with SMTP id
 ada2fe7eead31-7d7396a6eb9mr826644137.35.1795172426626; Fri, 20 Nov 2026
 03:00:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com> <20261116-canfd_rzg3l-v2-1-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-1-89e06c46f40b@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:00:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBB=tMDtssy-8r4=v_u=Pid51gFC1LOgzP3vbJQg5HHQ@mail.gmail.com>
X-Gm-Features: Aa3M54ok0nFqWrmNFE92MZcAAo9DF0uGdtmbDc1Y1AOqliGu_4a_ac6uIR0TZqI
Message-ID: <CAMuHMdWBB=tMDtssy-8r4=v_u=Pid51gFC1LOgzP3vbJQg5HHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add CANFD node
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 16:33, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the CANFD placeholder with the full node description:
> interrupts, clocks (fck, ram_clk, can_clk), resets, power-domain,
> and three disabled channel sub-nodes.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped fallback compatible based on bindings.
>  * Retained the tag as the change is trivial.

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
