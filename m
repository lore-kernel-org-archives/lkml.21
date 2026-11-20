Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208837;
	b=NdwlatQKT/9DcK682kpQ8VB4iw2irm9JWZUgnYhRxqrGOqei9U10EJ2g7KrevWKTIQ8G
	 qF+tbbD6gsykcmiRi9X9tYqXvNa24Fn8AvMOeJhZ5p/n0VqKhlt1UzTT0UEgxAfTU4YSu
	 mroio3CnF0QeK4KUJWsI5Ow9OQl5WpZD3IwVAQmqHgL+HdeOyBdqMuW8djYRHT7n2EdUR
	 MMMII7WU072TXdEfYuxAu5WGOxOKpAMXhFM/Yyf2OTPITnl01dCDBaR1TxxUeCIgrcAKl
	 EwrMLRwMNWejU9swvz399KWTqvw+/HNZqItvn9XyrOkQfLJ73zKlUljKewvwVF6d8OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7jrrtoj6v0NCmCpB0Z88oB4a8HDSQG98zdWLNMlabu8=;
	b=sr3m+St7eH0+Y4qZmvsLRtezkcnb5wIXBVAtpkMnFFrmB9Asjusf66Kj0cVo6fPp4rYX
	 0eu5HS09K0Kx8Ohibys1zuemdWEHqqhb3QZiM/Eu5IoBL10oTdJ0C9r3gruNGBXnFuW9O
	 z4BuZDcBwFEj+u//aBmSvy8aWuXBt0y4+04Ylgm33FRq+ZwukPMzk6qUc4M7ExDaNTm6d
	 dd2sW0yG3i/WspHaRRkl2i8WUY+oW5sFLASFQkkhhJXPnrjECYHFs2jAKjwtrd9ETLJUr
	 Su348u9eE79+ZRaNZAFB3QqG4B/4gDUWdFaPV3vchgSOZnrF3pcQfBmFiAMi2JAS9cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwVF4Jn9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D076606A6BA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D076606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwVF4Jn9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38190551625so2279496eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795208835; x=1795813635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7jrrtoj6v0NCmCpB0Z88oB4a8HDSQG98zdWLNMlabu8=;
        b=GwVF4Jn9eZO2wRAEn0rlpvXXCjH4SynS6Rs4Y1execPCOih144WClMxXEP51uMNjQD
         ZIJfSuOKfpql7V91LVjEVljkGN1+Xavx1ldMekNwrLuykliRCACF6NHgFUQsI5MThz+U
         Wq3KQQA26RNCl0362YFySpWZk9oPtqH1lHgW3iNYTbaf+geMqyrTxuwFFliQvhl7YQ1O
         DLPS0il4qQPwVgTPgO/5TV1Q0aqCrsDtN+57aJZEL9dmU/vM9hsDQEGfhiMwV173oBkx
         YawPjrGxY5zV0n7NKVtjS8vw7b9DK3oWwHGmQlWX0YUpBcYBd1mQVKJL13snXPDx3erY
         8XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208835; x=1795813635;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jrrtoj6v0NCmCpB0Z88oB4a8HDSQG98zdWLNMlabu8=;
        b=ykuicK1r9IMALaLqgsYWo0ajAmCpC2mnXz1VjQze0nR769F9x+RCzSrlivFC0vAQ5b
         NVb2ncfQ5c3cFOPffJ4H/gUNBi/fgBvRd5N3YGTePQFuMVCuuajz0TMn/dIhvc5n+biG
         q6U3JPFy4UR1Ox6I7rZObqN1BmqbDy2jQXbOL6PnFcQkZBX48YmFb4vPLqJIXzFqqEXW
         KBY6NQcq9Rf6UOqLM8g0KwCX1vKOpDCEDRXGC/txuHHsyTKYh9gw0jkGmjz2xHtCAb2i
         dL0tYn7q7EPbRRvqcpuA+CjrKdEhDuyfNT7kQw1ys0qWiWsy4VQ+lUSVnY4qit4gCWT2
         mvzg==
X-Forwarded-Encrypted: i=1; AL+hErFokXVouTzfCZjMZIhYLJBE2pX8d8SBt2ss5TKYgZG//EchJ7Um3mfdFYJx+/wCN3OLC68uF8pROXsWeqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I4sOF4EeX2e0SBVPze90ZCN6+oAA+DcIEVOSk8iAdoyEfQpGY
	/ArveKoSmUmEIKFO3r3XANVJNG2hr+UOAlDNxNDsjwBeIB5RRcnLrI1p
X-Gm-Gg: AYBFou3PXiwbey+xSpwX1543idstX3UfInlkbyFsqQsBjIK/h1D64GqchI4eh51fTOl
	i59/Ls3WlNSEKOfsZgLI0Y335ZAPqSkHwa1/73y2QT8vkeA00KKgJKfKPLZbTDpvg56ylJNCQyz
	K1W3dgn/ULyjiDisltjB+f5XexDhxnLx1gh0sqFp9k031VsK4LotdPIsmltkQPmU2H0Vw+n+u2R
	qTgGwpTHeq2UD85l3SG62p5OPEA1uDVDPhIa5wNxx8sHhwPytgrgGXugu6qjFmm4RCW4gzKZRe2
	5citnkr8BDVxXIwOR4j4CVSqwtmGEJlMnjvXpupjuSi9QC/SwyloYjzUprd5Suxd0OvtaRYQe8U
	zX8eoFKYhp7duw6bjL2bDVoTyoqkIH1wd8H68EjIAP3IM0Fl3l7E+wKD/kwfAPUsbgJOJHjtYdD
	G871tZwK4T7EwGSkjOTzL9k7EFmi+rGlUJFIeOwfFoybHNjpUcWjYnPKAZ8T95m5N0pVzHyh8St
	Qw+uAtHaEu+xvraGv3uRgVwk4YCbe/w5xNUffIsI4jbfRj0QwA5vKUgF1XaHscPn2KMs1v55zJh
	HfKprYRQLo8wwLg7+3qI9ijr5qs9g8treTDmtSbIh90Ji2uaaL2KNtuZzLc8cs/RLr+73UOlyUa
	SDIFWq488oh5PafugJ4eyGSGo
X-Received: by 2002:a05:701b:2083:10b0:164:4e36:f956 with SMTP id a92af1059eb24-1b5568b47a4mr4157620c88.16.1795208834608;
        Fri, 20 Nov 2026 13:07:14 -0800 (PST)
Received: from ehlo.thunderbird.net ([2a00:79e1:2e00:6c01:7cf7:3a98:7b9f:8575])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm8822424c88.10.2026.11.20.13.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:07:13 -0800 (PST)
Date: Fri, 20 Nov 2026 13:07:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <bentiss@kernel.org>,
 Gideon Heinz <gideonheinz02@gmail.com>,
 =?ISO-8859-1?Q?Filipe_La=EDns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>,
 Edwin Velds <e.velds@gmail.com>,
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_04/14=5D_HID=3A_logitech-hidpp?=
 =?US-ASCII?Q?=3A_disable_works_before_stopping_transport?=
User-Agent: K-9 Mail for Android
In-Reply-To: <73r1s387-pn80-s74n-o50s-056r1pn8512n@xreary.bet>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com> <20261120-hid-logitech-hidpp-v3-4-cfe2caa1d0eb@gmail.com> <r078ror3-9q6q-s581-35r4-63pnp1p93s85@xreary.bet> <awCMOvYf64DZfuWF@google.com> <73r1s387-pn80-s74n-o50s-056r1pn8512n@xreary.bet>
Message-ID: <2F4EEC0F-5662-4FE4-B9A3-9FCB83B587B1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 20, 2026 10:12:23 AM PST, Jiri Kosina <jikos@kernel=2Eorg> wrot=
e:
>On Fri, 20 Nov 2026, Dmitry Torokhov wrote:
>
>> Ah, yes, I un-exported it in my hidraw cleanup patch series that you
>> just applied=2E
>
>Hmm, but that cleanup is sitting in hid=2Egit#for-7=2E5/hidraw, while thi=
s=20
>build breakage occured in for-7=2E4/upstream-fixes, which is based on Lin=
us'=20
>tree and doesn't include that hidraw cleanup =2E=2E=2E

Doesn't next mix it all together?=20

>
>> Hoisted by my own petard ;)
>
>:))
>
>Thanks,
>


--=20
Dmitry
