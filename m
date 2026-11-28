Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795845466;
	b=m8vW+mIOVBj9Bx1ihxlifr4fGHmet60Kw4xRVFpc6qKWXQLWJ9tdUTkseEeyL0NdHNPb
	 LhrzUmYVRygQPLu9nSfI5K3knvJ9JF3fsA2BO1bhAuMwSFdqVQbF6m6p9PGE5PF1zmHky
	 hEPJg7N91/pyy1S69Kla04bFBd96CtXItXtYdC+lvLvutzrBWcBkafWHi9ZReCUbQTW3n
	 hUTdykmw7DPm4a6zFKFhOQamDyQMnuK66UzXjb07LHejuDPBQVQfTm4ZKzLjHkmpiS2A7
	 3p3Nu5RsDLkMJ5iIBpLPb8fSoIpCtMEbWc172IDC0I+7YcKK7MoK+KDskq3C6+iIo0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795845466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
	b=HwaWEk2oqQljOoS1ZrF34mTlbO0dhw7XPuKiRCq4MHxPSbdvG/3NSN/F9wdQxHdVZADy
	 izxRPWISpLuhSmz/Eunc6BNBbtRZ+QPMc/vReRQFQr9C7OZXZHQiOkpji84HhYrEAGzQ4
	 I8aS3dE708Y8VO7eeHsZs3mCDaVtdn25LltdGqlAGA2ZbSIhx8L0CPSVz6DhMAkG8GwKU
	 7hI/L6IebIXw6sIM1izHdpNlSirDXV6zR+RKc/zeOoUXSo8/B0Gbw2EmVFQQiIjz/OfMQ
	 lO9UCkPZZVZNkyMMsFA1nndY1TISchB7v8f4iYiaqLLsOPNIazTwXyZ/HouTTSOieqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmrVlhXl;
	arc=fail smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5926606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5926606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmrVlhXl
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so11252251a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:57:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795845464; cv=none;
        d=google.com; s=arc-20260327;
        b=dcY0P33+KHvTo2UqEERXDI4QDH29hTqsrq3Qlvcx6ayf+TgI7x9BNqCvNTwnxJlwt8
         ZDgQiUis4S2iiVuNGJiDzfx34s+fUYVzGTdecqDCvTFdGVwZuVrmeNJBXxUxxYdwy0mp
         wWc7gygSgCntTyVw1F/99enjYpR4mi8Asx0Oe9i9VTdhSdfftbD9zRJTSpgYHXA1mTYJ
         CWYTGmcNtxqmt5AuhUNtCLS2Gg8kYoQs8BP1EIiZqlEsUDvV6GaQKAydgEJ2mxDSE7KK
         7U/SJXkSPUKRq+f/hUGdkLTPcbjtbJ+BbUTW9GoZm5cEg/f9yRP79jvQYzGGQUYMlylv
         GJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        fh=0S4CIrFBVXKtC/Le+a9qFm7VCTKrGmW6UJmr5tVvoW8=;
        b=mD423erMhM3ZT7XUY6aXsva5dAJ8BFmyeuTf1LPBR6IxHoEXAUUagme1wLRzbmqRou
         mfsXKBTa2ik5eqKN5/AmZ/DfR+60qH1ak3+6GNZufauHX5wFzgkkGyqFE/7bhZqOnBei
         goZewBoLc5tgUihKTEmuZ4w6h2rhNqQ0+87gXUwsU73tvpMaqmTxah5N5cupvK8HlZVt
         JK1HQfCJz3rNETOzQ8yQd/9m7KW3cd3rkgJNLh5686sAtmHkiJInX3db2q9FvA0k8ihM
         ZWgq+Q0Kkb7cQSBEJMval7vQZzc56L01tUaCGG0THOEZ/ChIpcxaanfVhgOlnYLXmb7M
         ckcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795845464; x=1796450264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        b=lmrVlhXlsaVMZbgADEPkAy0KVpZgtUOyXGrTxm1M/dNcpxO1ziLWVZEWjImIs7nMKz
         QS8M6rZjvi6UQ4t7uY0V7e86nAywZ+m4bZ9q6mxf4iJRVezZ9yBOGs1zJYsIwyWAiPq9
         KYilKGfeAoBXzFfxukar9PQfOhfOcx6QM9Pmd9Wi4JuQScrJtbKjRQ9X1otNCOJ1sV3T
         Cj5ct6gA/N0tIfcq4HwE8JZxAgVCoCi90dKp+Tu75zIML3qLio09zLpyp5JA1hVN0Lpg
         OsVrSQpCWzBTKlRmZf8CVVBuZm06DRtdcCP3uTaCtU0EAgH/i8IBepG06JXELgKdScq6
         VN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795845464; x=1796450264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        b=Xv7dq6ejVZ/B2/CpYrZ4fpmUur4OWfAjusz4SndQdyGSRs/1AXK8CxhiqDSBZW7XXY
         9tfRBnt2vwpFDHKOlkonlcGxapiflKB4s+rTlprl8N2HCZi2SgJeuBQLS7wFzaFDnpsz
         6fY1H5lkbYgLMsDBYFwc/Uly3DiOc5lfGixTQli33zQ2sm2Zog5/6+o9AlzFjWTZNcFK
         ZCDycrNAHuwF9nIDFbH+FxhWMOc1XXwQt/EcGiXYnqNGpeY0Q3OY0dlZ5r9U1RRN7VpL
         n5Lk4uJc1xwb+dcSjUQMIF+oz3Jzz61mlgEB0cEX0x8oGOYtU2gyxwre/3Kpk0VDGiwF
         578g==
X-Forwarded-Encrypted: i=1; AL+hErGQqlnCHxOAKxP8WBuTEzhGZa2G1bLo2EAi81RRLj5sm+ART1RhETv/YWvuhzh6uTD7xp4v8+bMy5ddJug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/urrHy9IpSfZ26PY9ZTT84zZ26+7pPQAHAMziG+lvLmWnMq6T/
	AwgwnT4Mjz7B0Spz6Zcl3Gwb0jnqad8at26D3H+wWTwx9seNMSX4Nl9EiSY4Aw4HwAaiLoG2c2o
	bwIDXwAUN//BJucLIG4SfJvOmIcYbhw4=
X-Gm-Gg: AZFdTZeDSCWlnbbzTNiR5Ty+a2uo8Ve+sDQIR+vkaQMkn9zJmrdanKsvnLKXZB5PY1t
	REmwSTKfh6Q9Lue1p1ym6pH/7tOZnavGz6kxcyfng+p6K5ax1PGy54/1mFlF2kaUG0S+GfRRTkY
	N6zqo+Un+5yATnuMN9LjLjb29Yha1nJ2DlL+IkDDOSySTwl8yN8+FQ7zOcFWiaLXkV4FmyvD4LR
	LyNGuIQLu79qi8wGSJOcSGMnvUTLq3MI4+8SNbHaajezHqC45Bav0Rn5ifs6ymEpIe6fPkmsjEK
	uIy+dg3K50W6ow+Tjl6f/ThRgwTSuhrlLZwKV3ejtJuhPwnom3wqrvbOaX1AOnYWJeAJBDCYWsU
	qoWgMOc7LlJBtDmvFgm09BMcMdnCKJcN7zCePD1npRgGG5+5lGbD1iZYtbHZcdz9wVQ==
X-Received: by 2002:aa7:d684:0:b0:6ba:1e56:b7a9 with SMTP id
 4fb4d7f45d1cf-6ba37d60695mr15032079a12.12.1795845463903; Fri, 27 Nov 2026
 21:57:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Nov 2026 13:56:59 +0800
X-Gm-Features: Aa3M54o6oIEszh6kY4GXIp-jdXDpJqhKmrWjTLxx512KQpOfRsaHP5EMKK4ufas
Message-ID: <CAH2e8h5UCUz0hv203SsZROm_fTRptUzT96Y=ZBNozvD7ntweEg@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] arm64: dts: qcom: sm8750-lenovo-elden: add the
 Lenovo Legion Y700 Gen4
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 5:13=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> This adds a device tree for the Lenovo Legion Y700 Gen4 (TB322FC), an
> SM8750 tablet, together with the board compatible it needs.  The device
> tree itself is unchanged from v7; what is new is that 1/2 now documents
> "lenovo,elden" in the Qualcomm board binding, which v7 forgot.
>
> Why that is a real gap and not cosmetics: with the device tree alone,
> dtbs_check rejects the root node,
>
>     sm8750-lenovo-elden.dtb: / (lenovo,elden): compatible: 'oneOf'
>     conditional failed ... 'lenovo,elden' is not one of [...]
>     sm8750-lenovo-elden.dtb: /: failed to match any schema with compatibl=
e:
>     ['lenovo,elden', 'qcom,sm8750']
>
> so a board that builds still fails schema validation.  Adding the one lin=
e
> to the binding removes that diagnostic, and the same three SM8750 device
> trees then compile and validate clean (see "Checks" below).
>
> Relation to Pengyu Luo's series
>
> The same file was posted before, by Pengyu Luo, as "[PATCH v2 0/2]
> Introduce Lenovo Legion Y700 Gen4" (2026-07-26, 1170 lines, based on
> sm8750-qrd).  That series did not go in: it is at changes-requested, Abel
> Vesa and Konrad Dybcio both reviewed it, and there is no v3.
>
> This posting supersedes it, with the author of that series in the loop:
> we agreed on 2026-10-25 to squash the board descriptions and send the who=
le
> thing this way.  The binding entry in 1/2 is the same line Pengyu added i=
n
> his v2, so credit belongs to him for it - if a trailer is preferred,
> say which (Co-developed-by needs his Signed-off-by as well) and I will
> add it in v9.
>

Feel free to incorporate my previous changes into your series. I am
happy for you to take the work forward, but I would prefer not to be
involved in its further development or maintenance. (I graduated and I
am a 995 full-time employee, I prefer to have a rest in my free time.)

There is no need to add a Co-developed-by tag on my account. A
reference to my original submission would be sufficient.

Best wishes,
Pengyu
