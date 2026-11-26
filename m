Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795722032;
	b=LzikuIrHzIp53iK4DrozZOhY2JixcP53EDi4verq7OBbc0DPQVElGmI+6L8nMJg/IUnn
	 wUzM+HLVGL1aakEQg8qLEi2Uem7EXBNyvM9adjcf9giptiqGu7c5oKv3xODE7IaksxA9s
	 SiaqnGQqdKtQ1fy/U+R+5D52B24Xm4wwvSc27XlswbpN65NsPJmy9GUoDv0Nb37ZMeHoN
	 1blJLyz82iZh/SZe6jSOUDlTcWrG7Zvz8otFtJr47i8KCCtnBTs1MzEFiab4KK7jp0KfA
	 q9/6v6mwe9dQ8VHE3S22qK/0Bpm5xz/TVAiomP4hp5gELwqdxC6Btq4Liu323iSB4ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722032;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
	b=RSqWeiht8rqpqrmXACB5IylZZospI41wZ7KH3hMX9eAMPcs2NV0hc4EQqeL6Qe92ePCj
	 YqQAs5ZHCC5oixPjm5Tn+bo+KsI5l428AUt1eaHLHUL4c+GBo2bas+eLIxtW8SvUM8HAS
	 kul/KoIrvJwj9yclIiStzFWcrvbDcYwkoIJ5EOX+0MYdK8JcSSTAfGOt/9jFKH1x6jB0o
	 zEMZq3zDdvmXX9Ag07D81YOZip1pYRP+ZlgjiSKE2ILNFytrWOYb7jDDa78xjIQrTdElt
	 FCdyFaA7dwZaIWYdLhsgY3dI0V7dTXnGJJ8JC62cbDcoJtHTQwpvmiPePkoNQnXZNLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GcuCihy0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="gOkql4h/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D30E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GcuCihy0;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gOkql4h/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795722031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
	b=GcuCihy09c+faZvz3S/IKGLXI27k43WZJCkFhf+VjUX2LS1hVZpfYXErhA1fuMNf4kGzDZ
	+qH1zDoCW+XqRm72Jto2x4xPstm7BrDEnNXdyDSu8zgqtO/MLOwrKqBXqdlOUsqJLzx3p5
	UIJ+1Chfj5+bwXpScOXU4XkzUqRwv+U=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-DgvM9-vIMlipKBPnZ_80Pw-1; Thu, 26 Nov 2026 19:40:29 +0000
X-MC-Unique: DgvM9-vIMlipKBPnZ_80Pw-1
X-Mimecast-MFC-AGG-ID: DgvM9-vIMlipKBPnZ_80Pw_1795722028
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386b8624cf7so5133510eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:40:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795722028; cv=none;
        d=google.com; s=arc-20260327;
        b=mQY9IQ6MjlKICLOwEawJH4mpFAyzr632j4qNFZTvWaFnLG8ZzGwncsiB5RrfkuOku2
         wxl5xrPKhih29Bt3Hb9Ls+5YyVY0dS+0nv2bGkn3CuVOMPL8NrAPvBDTC1104798xBAP
         6ntF+S9i7LuoYQ605AVTWJ9hLtgf72P6LPgGFYAj5fk5EOrjEiF0lZxwv/drWS+vSXEL
         Q1A8bL2viTCbN5RfrgsfrtNri2eQoQ8OGMt093p6WqfdKqupoxTXiA6SywPK8d7S6Hja
         nrjokyAFgcqeC9qev3OXtM6QsIeo7BKp3E+5noQFavAsGe5jxYmMDZ77Gk/yC9O0abu5
         sr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
        fh=VjM3GeOCc5/NZlIIWPb/13i9zs/JSkOKinMvhPnNBJI=;
        b=ijZkfcOkevoe9TZXcfMftl8zc+lDYkeA6SmblERE13Mcim7Be2LA3FT+x0slBrsBk8
         QduXJSpUZ19kNbH6W7vzW2H5TQfCWoeWA9emw6htoMpbnMXgsYoyWq4QISZvBAJdDAD3
         DK14hRJEVHaJ/KAZ+GblF0fKlqUSFWl/rlT0UwqOljkmktR2abBKyRDQ1DpBkXvZxV6N
         uFuiN24Ft+mI4HPcT5j2Jx0TbLL6xTBlLrj1+GiS9VVlrT/ZY10Qzl75uUI3LY3bYmiD
         iRzZF1QQv/nD1buT42vg6JAnv6/NbS9wEyD3YFcOBkMck3qrF4vaUUAqCWqS6dE90Xyo
         sXmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795722028; x=1796326828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
        b=gOkql4h/Mdmdaf9ZKrDZtT0Kd//Tb20W7FJNUoig5fnab2TcBgwMknFEX1uBpozlsY
         8ORSoBbvVSDcedOCVzbHpZWORybezRnREo10VBkrZpCOvFTyAhWWVJpP/fpCZ4v1Xbt5
         TfiG3mVp6Hv0FBoqK8PfYmif7Yq1LhldpA6g6O7WovDllIoj9DkZpQ59lLTD2T9qCTeh
         BCjc5DqBvcdboKxIicPoB6okcSh6IN8rCItHtQmUMPTS1rPZ3v1Ec2FH+oujN+24uCUH
         yXAmWlRGgkV80GK9SH6DxwHQ1zYg11wdj/YZErjcuh4FXu8ShQjHII8ojqOpzyioQiJ8
         9njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722028; x=1796326828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
        b=h98y707ZY6e6mpu/MIOgbhtARS8ReBRn8lKv8ct+JlMfVP5uGnDOb7Lu9GFVX3flXC
         nOvB/5gpGYY7CDLwGQ1/yU4myiSM9KaNoOPLpckJklzhVLhgvpCq4WU9MIEaC69u07Qi
         fh6Ql2zFmINBkbxq8uV+POAgg+3S0SaGWyz4nJTWebprN4oC26560Z5eA+uVPqDUBfEi
         VQN0XfWhSP5cebXzJv1LwiM3y2iitIlJLIlncv6K8DAMiH5EwI4Gr2ruXYd7Ral1cNiX
         qUA2jUNqQ+pOW9Nue00viA/21JyRH59V5rINLWmOaFB1bnipealJDMfo6E7Ubd4Gw/NP
         Wi7A==
X-Forwarded-Encrypted: i=1; AL+hErH1QhWHoFhZt9OyOL8fjy7C5tZyJ9JcW0ErsCgAvZuGxZGHaLXQKQxHvXriAhnUK9K1IwkNC3/gcA2/f5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VGAJ+sLn9rI4UnjCUhuplM8uw6fVNTqZTcNUb8340R07u/C2K
	90zZgGw6Ih9e1eRbo49W1S+Eng1DHAHgHPZL4cAVnW1HsyFQDq6r+I9iZ4YdmV3nl3Tp9nEvH4E
	dbv4iBWclj68N1dCVT92XOj/mHnWShzPk1Ece1SD++PMUG8LMsET0rciEd4LfJC3kM0JE+v/EHY
	e1vKzulo6i05jgg5aC67g4bOshlGcBr1GZjYwKdw9V
X-Gm-Gg: AZFdTZc6GRYK95k+jdw9tKzPnAUv7w4VqBxjSnWTLfnAThZqDxPD7jTOdO/fcwwXBwB
	f9CW2foZ5fqIC5Jcjrfb2oH7OutrvBFet7x/VW9YDkDgLHVmM8Pm7KHeHP7Fc2u0Yd/VtK6fpXH
	a/nwa7wpxeDrkBeOYtoA72Mtg9rf5W+Xq/sFTE78mY09130BQycaKeRqDe
X-Received: by 2002:a05:7301:d805:b0:385:ce95:2e14 with SMTP id 5a478bee46e88-385ce953221mr20846988eec.30.1795722027768;
        Thu, 26 Nov 2026 11:40:27 -0800 (PST)
X-Received: by 2002:a05:7301:d805:b0:385:ce95:2e14 with SMTP id
 5a478bee46e88-385ce953221mr20846969eec.30.1795722027291; Thu, 26 Nov 2026
 11:40:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124074531.1701179-1-rc4d5a@protonmail.com>
In-Reply-To: <20261124074531.1701179-1-rc4d5a@protonmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 26 Nov 2026 14:40:15 -0500
X-Gm-Features: Aa3M54pUS8i_NVj6S1gEviSRlU_cYUkcIfq1IIhW5z8VzPWDIC2T6EQTZPDGXFY
Message-ID: <CAK-6q+jR1fZh6PcMKPpQwFW-89GLw6eSuUkC-kCLg+sghO3RpA@mail.gmail.com>
Subject: Re: [PATCH net v5] ieee802154: 6lowpan: validate fragment offset
 against datagram size
To: Ryan Prinz <rc4d5a@protonmail.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2026 at 2:46=E2=80=AFAM Ryan Prinz <rc4d5a@protonmail.com> =
wrote:
>
> A 6LoWPAN fragment carries the datagram's total size (d_size) and its
> own offset within it. lowpan_frag_queue() never checks that the
> offset, or offset plus length, fits inside d_size, and never rejects
> an empty fragment.
>
> A datagram is considered complete once enough bytes have been counted
> (fq->q.meat) toward d_size, regardless of whether those bytes actually
> form a contiguous range. So an out-of-range or empty fragment's length
> still counts toward completion, even though it doesn't belong anywhere
> in the datagram.
>
> IPv6's ip6_frag_queue() already bounds each fragment's end against
> IPV6_MAXPLEN and rejects zero-length fragments; 6LoWPAN had no
> equivalent checks.

There is a check [0] to reject d_size above IPV6_MIN_MTU (max ipv6
ressambled packet size), so checking if the offset is in d_size should
be fine and we have something equivalent here.

>
> Fixed by rejecting any fragment that is empty, or whose offset (or
> offset + length) exceeds d_size.
>
> Fixes: 7240cdec60b1 ("6lowpan: handling 6lowpan fragmentation via inet_fr=
ag api")
> Signed-off-by: Ryan Prinz <rc4d5a@protonmail.com>

Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks!

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/net/ieee802154/6lowpan/reassembly.c?h=3Dv7.4-rc4#n302
