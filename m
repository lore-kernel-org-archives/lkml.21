Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779586;
	b=BAn9xkxwanasSX4BtZNlaO3s6+q6a7XqoPz0702jq6JmEQVGWz4tRx4g1PPHvvLwDfNv
	 sQHRb+q2Gs/T2+o06Nl9uCavGenb5RtJ1l1AvHz0sRfFvYbpkOK6EaHjy8W5X4HaP5hgB
	 u/uFuzx/0LURUGHKDSZwWovlCqJNwpVgLAtIJ8BShGXBPY1T4JrF4DWNj05kBRmBCzUuV
	 hWef04m7pQKwFqgPuuAQr7VyQXcaRrZa3p0ZUolkWcDd0TMr4ba9zmrECKFHlNroc0CMC
	 mNLK8uxYhazJ3XCjrllqJ+cyEGt5jVj8/mVcdw9r3SkORTBBBQihTuNMiq+tVs2xXnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779586;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=6Vw5MFQSiCnoTbhpDTIOOLYANinJV+q+O8Y5w+EMfCU=;
	b=0f+9KzpZbe3MrlJAe3ch/GzaCMKygixFu5AyB0/SOAy3mdIHmN5G7iYhoTVCHsPSEzRS
	 BxV52YpeIX5/xokTFXuLuyfsYJsCO7fis2Tprc5pvwQRheykb55g3Ns89LcNzarhmwqUO
	 M4Rmq0LD5ptiHc3P521buVzNebSZWaArIipN8YlUrnJ10oqAawzRhYxKxUzt6x/tXfc2X
	 OLOLp1wV01urMWMGIRgvycfOhgTu9tAkCES4HNa3AGkJTFUdt2T4upRBBQ8tL+1upgmxd
	 p2G3yMwPwobd7X4WBXv28mTn0rHxmJFjjQeOD1wb7qcWTfrLeXGGOZ5rBW0ik9QoyEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eTDzyLd4;
	arc=none smtp.remote-ip=95.215.58.156
Received: from mta1.migadu.com (out-156.mta1.migadu.com [95.215.58.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81E7606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A81E7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eTDzyLd4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6/HpsLY2JkuqSqhjUbLwsS5eaX4PS5DHlmROlk971Qo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795779583; v=1; x=1796384383;
 b=eTDzyLd4A/Gf8huHVODKAimMBgUGy5krpiD8t3JNxUTrlt9M5oRPYJHjx56WiwCAfTWxiVxZ
 aE1O0m5RTKPEyt5M3p989N96LBnhkGUDMQUCNgyPSLoNbHXOFPhl61ymQfBDY3y6Yk8PARgEEFT
 qhWSUTCF0MiLCOs2Ze4mKjio=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d5875fcf3bc412c3;
	Fri, 27 Nov 2026 11:39:43 +0000
X-Mizu-Trace-ID: d5875fcf3bc412c3
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 11:39:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <41bf3d5c801ea9fca972e07318819a9185a4109f@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] gpiolib: Use srcu_barrier() instead of
 synchronize_srcu() in gpiodev_release()
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261127070910.668333-2-aambrozewicz@nvidia.com>
References: <20261127023101.27568-1-qiang.zhang@linux.dev>
 <20261127070910.668333-2-aambrozewicz@nvidia.com>

>=20
>=20On Fri, Nov 27, 2026 at 10:31:01AM +0800, Zqiang wrote:
>=20
>=20>=20
>=20> The gpio_desc_label object are freed asynchronously via call_srcu()=
 on
> >  gdev->desc_srcu (see desc_set_label()). to drain these pending SRCU
> >  callbacks before cleanup the SRCU structure, gpiodev_release() curre=
ntly
> >  calls synchronize_srcu(&gdev->desc_srcu).
> >=20
>=20[...]
>=20
>=20>=20
>=20> /* Call pending kfree()s for descriptor labels. */
> >  - synchronize_srcu(&gdev->desc_srcu);
> >  + srcu_barrier(&gdev->desc_srcu);
> >  cleanup_srcu_struct(&gdev->desc_srcu);
> >=20
>=20Hi Zqiang,
>=20
>=20Bartosz already has this exact change in gpio/for-current, applied on
> 2026-11-24 as commit c901e8fddd3a ("gpiolib: wait for pending label
> frees before cleaning up desc_srcu"):
>=20
>=20https://git.kernel.org/brgl/c/c901e8fddd3a23353bb12c9d93b9a5fc482ac8f=
5
>=20
>=20It carries Fixes: a86d27693066 and Cc: stable.

Hi Adrian,

I didn't keep eye with the latest tree, Thank you very much for pointing =
it.

Thanks
Zqiang

>=20
>=20Thanks,
> Adrian
>
