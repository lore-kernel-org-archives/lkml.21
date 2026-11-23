Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471715;
	b=pOZRALtn8Ce95kmJNdizgwM3o6rsKNA2n/Lt5XOBNsqKTXV6J80agYYb9WsQGfOsCeT1
	 38XZXYoZ1pxpChW7eU6HCbJWUOMuBsb4YonEh1kDsuN/DHn6psZZX7kisLL+/9dMlj3Gf
	 92YKTRpbrFfmiemmqAmo8gQA1vAoi42aZ0izNslkDMXL/w8oAdRy6jdOazRhTifWTrZ5V
	 28bWQLBNOCHfZIE6MnBbEti0TGNSV9Rr/ZrPiqJpq3NpqoAqhDvvDbM8tOQsI/epz5wrE
	 t8XpSpwYRC7PKwEPeJEyPBVVBvNBvEiGgOtNfzJONqoMoe6Z4xYd/il+jiXGdNdpo2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=texhqw2pvQKkD9Xg5Q6V731C0QC/tI0cOgwUzIDMtYU=;
	b=k3+/OeU0z6osYbakXE+AxXbnykJ07nR0KxP3R/YCYVDNFZIuo0AdMxfb0dbNVEKCKzFp
	 Om799iM/UwtXgRO+gXY27JI1bEQO2j0TVYOqfncdT5sgsLa4KdB+oc7HA3Vilh+DaEt7I
	 aKWDXknvnrNxJGhSJeKTjEeYFuhH9cIZNTxFGuGq7DC6VmQgUx+eYui8qurau9XT/ttYY
	 H2YDzrEBxxLDPBq29RLwiCjXGpznjVYKUsoi0GlX4U/h0CPRxADQlqHZJnYYdVoNcZrCS
	 kpz0g05XN/xO6hi/9R1Lr7YVlNJY/usIV20iBlnCWPYuOijpzC+1JFo7rTSC57OciiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OE3jPoD3;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FC1606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FC1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OE3jPoD3
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b502b9b702so43841117b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795471714; x=1796076514; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=texhqw2pvQKkD9Xg5Q6V731C0QC/tI0cOgwUzIDMtYU=;
        b=OE3jPoD3spWhMvRbeMqnBiUcuvpHgiCIcdYnEHVo93acqTBgn3ar2ZB+IUkSDfnesi
         MvurJBt0bzEEA503YO7H0vRhdda5zHDaf0+oW92cnQyWxuFd2uTLuKz+kiPhJe9TbhEB
         yLa8/rQDmMg/h1hnPe8hLe6+ae3Go3XvCddngcQhY4x7eeuyVPW6PTZyokbzQsRwdij1
         NpdqNSwyU5c5E8/RVhZJWxGtc13NfC6CgPdYmn9Ow40BSBBrWh7J/9i7Qr2+ETyMLB+t
         gu+ZLrLgnwPlMYnYZM0vN8olDIrvaYaPVku8wt5ZHpsYZ0RgvKc2hw2Ucq3AjON9dVaO
         7fMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471714; x=1796076514;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=texhqw2pvQKkD9Xg5Q6V731C0QC/tI0cOgwUzIDMtYU=;
        b=v2+CrbfSN+q4AuZ6X7c6wd7XyfecGsNz89O+n4OMc9ZN6YIhiyIUfA7TL/ez6ARgNM
         0ynqPImMnQ51bmR4Vb6BVs4WHkS2gYH2KF5El6bBSlilM/gRzuiVeoaksrw7VUbc+UDa
         HcAwYmiMo/U4pQRgparn1Z7Q+azNAaWaEs8tVynVSgP71fqBjWCSlfVTV3RQqlJPIepV
         zguBW3M078w7WML4tadViQoWk/ZtZ/+M+CPA1rNREJZLRs8Lq7sS7l6V7o67vMX7U5zi
         M5N7TxtvyQaIW4ZuJJKa9nxoVTHklnmsanh6MessAVnIbq4KQB7le4qkqQh/y14iTG8a
         q+rg==
X-Forwarded-Encrypted: i=1; AL+hErFQClLI/orylxR5PVP43bmjHJz1JnO7fGpQIF0CuPdYSrpoYAHcnbiKMbTOBMdPbPWC3cxo/u8eK3e4HBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qx2/jqVWPm8hIRbIyfWBck0aN69luEmtnROKHTiO3OvhC2s3k
	QxcgR/hP6qVsepVWpKZpBuDEMPr5fcTjlSAS5xk3eJPdVAtylQNMLaPg72K3N8C7hb5rB5K3ul5
	YaXbOh8g=
X-Gm-Gg: AZFdTZcjTDnXLXINEUf7yvX6r/bXL32l9b3Z/oomn5inGQ3aYnzqAO4c1tX2+s69V91
	tJYQ4Sgtz8SlEpIQX4xX6HtZHoxV1BoMLkAsBFjYkmrJaq7xfBkXWK61dhx/vivvu/AYcqsYap9
	sIFKMiM6b2VAtsL+YAmFhPQQoqz9T3wYDZnX+Y6Ey526yQnX6cpvKJUgxGBPTCkoUrR+x565lWN
	NAhfNY+G8FurThA7PzhHWr1fG3632AC0Od0ZPhCjGur7qMlqjcFLPCfa0Tdn0JH4HIE9YlNt82Q
	Y0Y5mxrNPnCLtZviVR8HOx5ljb50BpzuRrPvLDbIyoGxZj8Gi34w7d/dxZcJby1sv22Lq0GwmR2
	qYo+0M4tHQ659u2sja4LvvqoCzE4aL08Ct96sslSMq0EY9FKEgPw7At9iSydCb1/+sVmZ3g/ieO
	k9YBPPtpIWxaf2wGOKecJgqmIgYEB11kiclaz8K3p5CDQvQjGjLLuTPZk8GBTbSqb7T6+lRcEoQ
	NgdRqSWMsRbWZSxzvaKg9OBwaZKuQ7kkzw+hqQorSaytVRQ9OVFEiT86PRlpYKtaV9He5lVlBYn
	eFbvSSIs53yJvwhTO5wpPkNbArQ6X0tiuIkEky+qIfbbLh7nRtnZGKVctqBZ/ZY67tjpEhe1bcd
	lGA+r2JzIzLjAc92L0q/k4szThDUgc7EmSGRInu4eZyOPD7p+KobNLo367HalvWTeeSnJjrlkL6
	eo8rTRKccsAExEwExAQnI=
X-Received: by 2002:a05:690c:2a44:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b52042bedamr45656947b3.10.1795471713793;
        Mon, 23 Nov 2026 14:08:33 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:83a2:1030:d4d1:10b8? ([2600:1700:6476:1430:83a2:1030:d4d1:10b8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030df7bsm52275487b3.31.2026.11.23.14.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:08:33 -0800 (PST)
Message-ID: <fa6344cbb419012d7deed74d30ae6062eda92fc1.camel@dubeyko.com>
Subject: Re: [PATCH v2] hfs: avoid reusing occupied CNIDs after deletion
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Mon, 23 Nov 2026 14:08:32 -0800
In-Reply-To: <20261121101918.3395879-1-hengyul@cs.unc.edu>
References: <20261112110128.4082071-1-hengyul@cs.unc.edu>
	 <2bbc10eb1dd5ee69329a9307f14fd15b1815b898.camel@dubeyko.com>
	 <20261113194103.3825961-1-hengyul@cs.unc.edu>
	 <f59ea6b2a8c60594361ab596d92bdf98a217dd83.camel@dubeyko.com>
	 <20261121101918.3395879-1-hengyul@cs.unc.edu>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-21 at 05:19 -0500, Hengyu Liang wrote:
> Hi Slava,
>=20
> Sorry for the late reply. I have an important deadline in early
> December, so I may be slow to reply until then.

No problem. Take your time.

>=20
> On Mon, 2026-11-16 at 15:21 -0800, Viacheslav Dubeyko wrote:
> > You explained a simple case. :) My worry was about the case when we
> > could delete some number of items between [16, 20]. For example, we
> > delete 17, 18, and 19 at first. And now we delete item with #20.
> > So,
> > leaf A should have 16 as a maximum CNID. And we can use 17 as a
> > next_id. Correct?
>=20
> Correct. I ran this case with the patch on a fresh volume. Creating
> a, c, e, b, d gives CNIDs 16 to 20 in three leaves:
>=20
> =C2=A0 leaf 1: root folder (2), thread of 2, a (16), b (19)=C2=A0=C2=A0 m=
ax 19
> =C2=A0 leaf 2: c (17), d (20), e (18)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max 20
> =C2=A0 leaf 4: threads of 16 to 20=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no file or
> folder
>=20
> =C2=A0 rm c (17), rm e (18): not the newest CNID, next_id stays 21;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 leaf max=
imums 19 and 20 stay
> =C2=A0 rm b (19):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 leaf 1's maximum has to be recomputed, the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 root kee=
ps 20 (from leaf 2)
> =C2=A0 rm d (20):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 leaf 2 is now empty and goes away, the root's
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum =
has to be recomputed: leaf 1 -> 16,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 root -> =
16, next_id =3D 17
>=20
> The next new file gets CNID 17. I checked it three ways: with the
> values cached before the deletes, with nothing cached yet, and with a
> remount between the creates and the deletes. A debug build that
> compares every cached value with the records after each insert and
> remove found no mismatch.
>=20
> A larger case: 2000 files created in shuffled name order, so the
> CNIDs are spread over the leaves. Deleting CNIDs 1916..2014 first and
> then 2015 gives next_id 1916, and the next file gets 1916. Without
> the
> patch the same steps end with "File exists". fsck.hfs reports all
> images as OK.
>=20
>=20

OK. Sounds good.

Thanks,
Slava.
