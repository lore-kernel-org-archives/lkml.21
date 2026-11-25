Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582278;
	b=vF5Q5aWQ02OieEETSIIPMPSNoSkLZFge8F9G8TiuPd/suQ7M36M78f/RdH2DOyYDKozK
	 ctcDVdwMyH+ov2ofG/kIUNStfgXz73y0me5vXZgdlcdYRC2KghVrDn+Zhd3nI9BPbUf5a
	 VVf/w9KThz8UN2DCx9IjiYh9T7YuGrx/wbgXLs0lHmI8KxKtmKM1J5ecOE5Giqzl6xiuO
	 81DwniJESf1oT1116cYrpWIP1Lwu4PUTafNIguBOi04rKbT7h5d/zLVH1kLhcZ+njPiKH
	 JhzTfmhuAXFxvmzLJiFOAEa/+Mxbj9Rzuhews4UFOTfIiw4/9KrN/yd2lMMXZkpiA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=GzNf16NNZkizHpuwga0Z0tMlnoHvbeUboIUcXI7KCTQ=;
	b=g9j6pX4n8Iu4vA6GKKKcFxFBOluAm+m1YGPreWCamoG09K32WqxPjwowMEBs3UtZS8DT
	 cLk+W5Ab0Yy7yb0GsIJU8r/7R0jim2lEPOXiedVIBmZz9y3aFB9HR80e8zl81mOsbrf4v
	 xed0cHB0cAQtXARd6cVa4RM+kZr0w0xQEg7PflqaUCdkDffyAbHA9oWE9HxWxQzRxCROV
	 G1UVU2uD/G90siD1RI7cfsySE39mmA+0/eR1qDJH28wVmSIBpAvCUnc5PT9j0fy9DmHdX
	 sNtPgZQ2opvfw6anuR+fFoHRUFc6o1lK7rpWHvHrsvD+vdqh3H/ISA5Hx+mO16HjIHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMKOppcv;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22837606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22837606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMKOppcv
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b413997581so4221131a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795582277; x=1796187077; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GzNf16NNZkizHpuwga0Z0tMlnoHvbeUboIUcXI7KCTQ=;
        b=ZMKOppcv7GMkcWPNGWwmyPziDutU9EquY2Tb1u7CJU/H0ved0KD9S3UTPJTxCiIrYe
         21L0mMIrsXo/BNHU0gbNODCyp2RJpG2SK4n8AIAnKS91M8hxsLLdyOOg2XpqPENqAzH/
         mKbUV9aIE9XQFM2xjMihS38qk5TlTFp02Ej00TjsqMEak6aySorRfUnMTioXp9qxWd9z
         UDJBHLiZM07mXwGvUduKcFvyQtFcuKxey/XDYFDGr+JT3HH1TG/RzvBLFnweghn6bTAn
         NJCf9HY7PXT5mPzSDRScX6kx8poiVcymnaHoFGPkrVh9H7mTlRt3lnDhqX76tMW+0bId
         g09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582277; x=1796187077;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzNf16NNZkizHpuwga0Z0tMlnoHvbeUboIUcXI7KCTQ=;
        b=E8OuZpa06i0r1P/etKIj1os0v2r9G/lGSns+xY1PbOHQ4UkG5gunXFuJuYCMHotxW0
         TUv9q3tqb5I8wm3WrCASY5m3v/047AnNb1cotu9Wl76fPN14vViBeS3T/M6O9tB/e8BX
         2CfmtjDNh7DluR4Qd8wATzNMQ+G62lGfSBysjUuCffraPU38sbOD8/6s6xGs3TyNzLdv
         PddGA44Rt9zHuUaTopf7r+Oeh2/QlcJGS9M0mE/p9qLy98J2/H9OuRAo64w0FCchtXh1
         XLqN7a1VzFJRm4jo5AGu4vwIRj6lAw7OkcOTD0l2ugTwc8oa3Bv52tXQRTWCntWBt2mp
         +60Q==
X-Forwarded-Encrypted: i=1; AL+hErFO48nvCcCksStlMKpZQTpqpFSyjjGuOh624sl2NZ3JhEPQEXpYeWtn714/2vOctw5hIrBYeWu3CCp3gkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pL3Azr7jKPby4TLKvStCSaCH/p8kbi34CkaKSvk0V7uWrB7Gn
	NCXY26fMyUqERzLbh2dnkNFAzWe6YZ7xqI4UbteA9gZS5lyKMeIGenaIB2qMHg0h
X-Gm-Gg: AZFdTZfPIrrZjzTBZKPwCEBo5WfqZS51AmlCZAGGqU5fpGx/nu6iaz9yyhOTS6q7Y5q
	rCI3C4mn7u3B5gXnhrBlctGUqWmUaQxzvAmD11cWw6E08bTbw6XDBpQU3IV4da4ijvEj0SEd0m9
	fOKJX615A6qtYTf3h7qCVGIrEPM7eFqMqwPNEQzdh/X1QUc0AqsQ/gqTNolF5pHiDPDK7oI/4nc
	Al8TSW/uNgYKaA9WP6R90i2yaoD8Fk66fgfj3sdNb4TZas+WLncIxX1P3ystBUUswasTh/WSjW+
	Uu8WUqgEL6LoReARA8Zyeojm0/N/xmRmeaKA73gOMOknExRhgX7aB4QcNRctQt5kUie+ZVR4QmU
	olvleUBsoCHfAdK4F9OSYzFc5mc77m9pWo76C/GGbhK4FRYzCBfU8bnCa14n1m3SVyf3s+sQxjp
	HD5JrEHA8kk2UOBbgy0fTrENXe56/7qiIUV5ITDJk/pOqwjvESujkbLnwC56+TkmPInYDnRqV5J
	dU0+D2g3V5Z+NFBfcXKSzLCua6osAKiIdDgcp4AjDnp3SfrseBrlpjzTVn/smRkhH7AReaKB/bw
	HAuHf0o0SbC4SwKu4w9YMULTO/NlvuackYEdtP/hFL6mjVHfZLvMUNkedokBDpFVYL+1s1dxwdz
	3XdURkYx6UwmJE43Kn6OyJEnKv11Gq0bn3Yz5pT1RkVnIZAHAFBAbZyw=
X-Received: by 2002:a17:90b:134e:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b41c7b638bmr13032229a91.7.1795582276887;
        Tue, 24 Nov 2026 20:51:16 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm30569330a91.8.2026.11.24.20.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 20:51:16 -0800 (PST)
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
Date: Wed, 25 Nov 2026 04:51:16 +0000
Message-Id: <DN40SM25BZ6Z.34Q3QLH6PYUXL@gmail.com>
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ryan Roberts" <ryan.roberts@arm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com>
 <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
 <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
 <DN2ALO12MI1Z.3HI553HDMO2FL@gmail.com>
 <85385aae-af06-4742-a39b-5a95e3e73a7e@arm.com> <awRd1mHcQDVNi9U9@arm.com>
 <0fad3d48-54cc-4919-bff9-254347c933c4@arm.com>
In-Reply-To: <0fad3d48-54cc-4919-bff9-254347c933c4@arm.com>

On Mon Nov 23, 2026 at 4:48 PM UTC, Ryan Roberts wrote:
>>=20
>> If Alexei makes the Kconfig change to force JIT always on, I'd be
>> inclined to drop this patch.
>
> Works for me.

kconfig change was applied to bpf-next.

