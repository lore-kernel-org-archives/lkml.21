Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955161;
	b=okwU2chw1b8U91jusXTdPA+N+WLfzY+/f9eLrqKjjiQd3MX/TfEYR4qKkLeJNfyUOwAL
	 kTmoEH5esCNQwGBab/6zx++NxHBBvoDFaiE5svD/kRzaXn5tD5KWMRr8xNVEKUU8pi9zg
	 EF8sHSDCIqftbGWdWzMIsfmxI3vtnX4Q9gIvr1KSsop3OJ+HCEChpi6CmxWcyTElMRZCG
	 7D71HxXE5MEMg4HpoH2oa5xzmOhDYKHWksbmR9xj7g96FYU6xZ8RSqKsBHsxyvyUVrPBg
	 gdQBeKAUAbB77sCncOYDodO9z8qljxVSXxsC6vXKeaiS/RfARjOP8E0A9+aSNHYzRQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955161;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=5sEtgRVogw5vp/h0xvhUk5WCTcmJS4WcRx79k13IZ7o=;
	b=289OvHU7LTBMDJbCg4ble3vslwBq/fGDPUFXbW2ZiiGdUpLEnB1AkkGYxvBpXPs7YMv8
	 2FO6peFREIrGj2dS0e+ZKKQmPf62YU+s/agwCi0VXTGub/V+39iNA5IhlaiLTEj4cQKHE
	 T/2LzjcYum6fnrbKm83OCGYHSp4Fs/+YndJvFBY/KTE0QJ0JuTuZaPbRacoSQ/PYywGxD
	 fbYK/xSLKrZ0Q7g2tpHJKs5pVGR51THfpk4gskcxBBWvWPAIz0XR352bAIEc27Yn9HeyN
	 ijhBOXwvJ3rTOR3dhZYGe9iov7VVCjwg1p3J3nhVXQ+Sbze35B/eHOJJjpqat3jrDDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sverdlin.org;
	spf=pass smtp.mailfrom=sverdlin.org;
	dkim=pass header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=Osfs4yAE;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=CC47ZTMg;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713C8606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 713C8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=Osfs4yAE;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=CC47ZTMg
DKIM-Signature: a=rsa-sha256; b=Osfs4yAEPBTvxOlHIS9gTliHty7sECWi442MUl6m94BF76iTAydV3SSqFJkT0ozKs5E9x/frlA54amxyvvGJEWtXEBl4DYKFtUbLB0kKGrJkLpx2CKsGk4l+cCVNI4tTgFkmuEe1AX7ZfEtqXqnUOOouuoQQ7PpGwN/9zyKXsljUOIc1QJjkVsvm7ADk2mClY7oTE8/JXSDSsdMFDv5dNn+UEZa8oKc6fzLbs9nlRTZdmWQRsksPshv/7gppjR4F5Ja76M7tu7lCUMKheIL/NH+1plvejI1nJXI6RZH0h3Kx9lPBV51BJVkfbmsfNOYfhyaTV221YpYzGz/9xOv8ug==; s=purelymail1; d=sverdlin.org; v=1; bh=5sEtgRVogw5vp/h0xvhUk5WCTcmJS4WcRx79k13IZ7o=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=CC47ZTMgbns6WCHZTbtn/MKMfgXerrYcMlMZt0M5fmqyTyHzNLajBOhjot6aZhBiyAlS5DADaOz883TZWEMo0TjEFpxGpmjIEjjnU98Qdd9KNlme3SIDJ7GeGO6CJrKOqD8mTvJzGXKXHVQCd9Klm1KPSKKfGXw4UuN4Ga/eew36Kb6jOX/+UXPH51S65PjFL7pz6e1k1UsEqIxinUVczhZbco2ntZHQtqEGmN7iMekzBz+ktJecZfdPmsGdCAlY0hPl5/87pWOWKdArynsyJWh0eDE5lWhgOi0WY22aphjD1v6upDFDy7vK+0Dh6Qe9MPA08A9xGXZ4bHhXQjwguA==; s=purelymail1; d=purelymail.com; v=1; bh=5sEtgRVogw5vp/h0xvhUk5WCTcmJS4WcRx79k13IZ7o=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1496021118;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 22:39:10 +0000 (UTC)
Message-ID: <f25ef379708f06f459dd7c4576ac6c47694fc74b.camel@sverdlin.org>
Subject: Re: [PATCH 4/6] arm64: dts: allwinner: a100: Add A133 speed grade
 efuse cells
From: Alexander Sverdlin <alex@sverdlin.org>
To: rajanyadav0307@gmail.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>
Date: Tue, 17 Nov 2026 23:38:58 +0100
In-Reply-To: <20261104-a133-series-v1-4-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
	 <20261104-a133-series-v1-4-58217cb33a87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Rajan!

On Wed, 2026-11-04 at 22:40 -0600, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>=20
> The A133 speed grade selection also needs the chip marking ID (SID
> offset 0x00), the word at 0x20, whose low 12 bits the vendor BSP calls
> PCPU, and the word at 0x28 with the bin extension bit. Add nvmem cells
> for them at the offsets the BSP uses. The H616 reads the same kind of
> marking ID at offset 0x00 as its speed grade.
>=20
> The cells are used by the A133 OPP table added later in this series;
> the A100 OPP table keeps using only the existing 0x1c cell.
>=20
> Claude Code (Anthropic) drafted this change and its message from the
> vendor BSP device tree; I reviewed it and checked it with dtbs_check.
>=20
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Tested-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
