Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079592;
	b=pr35ItM6BhNidLswfhLPK9/ES63hHEelPP28peAhz9mxi39VE4A22XBr3xoIRuchomZM
	 ppSJDQ0cooyTr4pBEB6ilFS2AyVOZeD53JqnlqqLiKBDW5j4rgl9Ilc+HnSsvaE/Ze7vq
	 GRWrvGzAYxJZI2kSFnNjK1V/QPUPt2v2+ce1NNif0MGmmoxA5cIu2aUEUADGWOEL2ILk4
	 hnen5/zXJcB2/JU6d65umFSx0BhLJlXO2B+7ccpgkMw8xS/nxSXA0pWNt9xxVe/C31cSs
	 Yb2IhUk0J2ncqIdtSSvUYMLKlnU96P59iOz7to0S/Ujkg4M0qWMnJuuhRuJ9FgFjILg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
	b=Y5PgxjbbaM8oOSSE+c3oHr6jT9PpWKuIWt52tZmfaoPmWQSNbDeUQSm2cPezIngN3I0y
	 Oe+lOA1YrKeya0DFOdOnuhc6NCJuyDHfDsvW0vf/j/HHbhIGQ05O9XTeCLdAiVOJ1Erk1
	 oMonoaatc835p+ou5bg1nwDwAbegkmIQQBYCimLqbkYYr3+G2w9luGvvPBLmssrDAAQYy
	 2oDUQg5c+WDbsHRDJY5bnkqfjOBES+DAi9imW9MWeMzcQ/WrC+BfIUQNJlGTVrqooBB73
	 fZ4P4nVy9fABJn2yU0t+Rfk+Hv36+Gg+SvsV0JYk6oMtsOW8cGloDUTgYO7rX4HarfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=cyYxEfas;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE01606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE01606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=cyYxEfas
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so318035266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795079589; x=1795684389; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
        b=cyYxEfasnJ1RB3+F9HQ3kC+3x1Suvkc2D89LpTI8+pw+eAAwycdhqJavNg6jfArG06
         7JOCKyjIFZw+nr/clzS/FlZF0tkW/tGCuolgw1y+hnhHah0vaD1owxv/OtpdlF+et24+
         5L6UDEJTNVsrLK4J+ku1kAWCSku6cLc/TckT9iAM6R+oPGnlb1CUiB3kUc5/c+MqFRyB
         stqsA0fzEfvyMaiEWLDvydtQsTclnOH9ybTAeNhVohSNOZyB0c9EwQfXP1kwiRFNT07A
         zWt7aKVRGzi7F2YU/x0W/Yt/TXqrDRWJJU0hid5GcWy+qSpR7k1tulgob5DMl37cK+Wq
         ZePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079589; x=1795684389;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
        b=SbHa+Olyq4EQ+zB+PSIuA3e65zZJeBBWnAIBU9ajOVed6Xps2cnv8/WN+gnjz2acGY
         s4jPpxEXAiUnM+xoQ8a5YXEJO7OSg9Uf0v2anI43gE0VJRAGcqTOBVmAaqV4BY/MqWM3
         CJ09QNTeoZKwQ5f3U1SGMhhoJB17En1MuKbThwYd87Ca8IDtoFa6vCD1NfAjc6wK+LSr
         UJ5bFRI/GGvt3ZaV8+OyiE9uOVugD4H/FSRdjF1zJ+IadkFqoSVNs7X3XAWTZ89V5ih5
         3OYC5QABFCYRnn0gooR0Hf23No3ziePzxmRV85dBsmL+1fTW5Tet6kmKw5BI0RPewYgl
         yRvQ==
X-Forwarded-Encrypted: i=1; AL+hErGi0EXAB8WkdRg10+yUU0+dx02rY5GXA7KVwKXw7KQATfWxpolEOR6eld6RMDyKNVSDpRcS8SoQ8JWUKhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z82DjvJjIu8/1h+TaYXx/kmFQuvJy+sDRecfQa3xSYWtHu3KmAZ
	+FmPPrsSgCW55BTLzGGD5hglVx5Yk9TkMZfDsSBXxf3vD7VDiikU+rSH8kg1B8FDfuk=
X-Gm-Gg: AYBFou0HLfcZmHRJyx9JZx/errg8/1wplkunhSJ2wvk1vHcFRU3INcaHwGBf/pvppcx
	tScYeMJjsHiM6/QZaaDrM6VDpHPdDXf9kLRt+pIjDHe4jyxdlD19rX7DgG1HFJP2JB3DP2S1ELE
	RMv5imG3qINU2tztzzerZDQ0RZYlbxgtvs90cGwa0E4dsJDkT+vNg+/5yBv0FaXXwtVNzXPC4Zg
	dkj+Z//nnGNeBJUHK+wwGzIyy+UAx07nHtjlMa+ml6c4jMhdc6fpVUC6Ty8Esw+nVD2XyFELXmt
	uLZ8Wik2MHVi0Vi3lXWa/wQa/iq0kqCVtOAlWo10TBVWRrNo5p52IKCwvFZKobQHg9sNLLPAXcB
	2PqfwxwIx+1wpZC7b6iUUceGcj9GmClpmg4/BmeJGq13ssIcwkWL6htZ8Fq6+gD+cPH61inLdMj
	SAEx83sbWgNHdEupnibAF1tT8mbzRYMEmigJBKcKA+Uero6R14ulwvYZvLCwW4v4SAzgbEvtdlk
	V/2tAC67LIVY+uGm2G1ENYXutR+r3N3H+joO8va2i8T2yfBk0Tv4ZLQ8ki47q+FB4BncSjw0d1b
	bgrBKqRKGBrB1bJ8oE2wZsGzi0olJdJLHefutunpoCvF3Nn/GnJect9oFji6dNQcTTwPHkjNrw=
	=
X-Received: by 2002:a17:907:7295:b0:c31:8cfe:9a25 with SMTP id a640c23a62f3a-c510e19d00dmr455876466b.9.1795079589464;
        Thu, 19 Nov 2026 01:13:09 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512341e0adsm87945966b.36.2026.11.19.01.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:13:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 10:13:08 +0100
Message-Id: <DMZ2LUM6AWXG.4IUB01OTC2NF@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring" <robh@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Laxman Dewangan" <ldewangan@nvidia.com>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Jens Reidel"
 <adrian@mainlining.org>, "Casey Connolly" <casey.connolly@linaro.org>, "Val
 Packett" <val@packett.cool>, "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
 <20261117-bat-temp-adc-v4-2-14d5d309ebfa@fairphone.com>
 <20261118164229.GA2892053-robh@kernel.org>
In-Reply-To: <20261118164229.GA2892053-robh@kernel.org>

On Wed Nov 18, 2026 at 5:42 PM CET, Rob Herring wrote:
> On Tue, Nov 17, 2026 at 09:23:12AM +0100, Luca Weiss wrote:
>> Document the property to allow using this sensor with io-channels.
>>=20
>> This means that the output of generic-adc-thermal can be used as an
>> input into a different node.
>>=20
>> As a specific example, generic-adc-thermal takes in an ADC io-channel in
>> Volt, outputs temperature in degC, which can then be consumed by a fuel
>> gauge driver to provide the battery temperature readings to user space.
>
> But this is already a thermal-sensor provider, why wouldn't the fuel=20
> gauge use that provider?=20

thermal-sensors =3D <&my_generic_adc_thermal>; could work, yes, but IIO is
way more flexible and can support the required use case very well.

From what I can see no device binding (or Linux) uses thermal-sensors
apart from thermal zones, so actually doing this for another device
feels like re-inventing the wheel when IIO already exists.

Please also see the cover letter from the RFC[0] under "1. Do not
implement IIO device in generic-adc-thermal"

[0] https://lore.kernel.org/linux-arm-msm/20251010-bat-temp-adc-v1-0-d51ec8=
95dac6@fairphone.com/

Regards
Luca

> Seems like this is letting current Linux driver design dictate the=20
> binding.
>
> Rob


