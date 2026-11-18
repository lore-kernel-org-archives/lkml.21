Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795043136;
	b=IbS8Oqh2JgMijgi+5tjlbh9/GgLUmtB5Nr2BuiehNkLQ/p7Qljqh3laXT/+YdYQNH8tp
	 AKYJ1UKyG9DthP3KnUIxLaZWn+MKnzWXXwzlZz0noaRdTdv2Qn7aWpa/pH/4W970N1lkw
	 q9FXDP3rznh4cO2uYSuiumUymfDip10kJZDXP778spvElOmwbWHGzx+5SZ8tORwc2gaU4
	 O1qUAPS6NvR0b//NlNDj3gUjiA0PvVVthyHjLlv80SZy4nbCF+YdTjirvTnwW7yGJ4rkC
	 5Oh6bZHd8WHRdOaF+Wv0uBCIBQVORL0zdkjJJyALpjAOws0opADFHYjU3NG9QrHtPgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vCTbNVFwomUfL+eJ/r9dTAbaG7zQETK5dcr4yzGJzlY=;
	b=kXVW1nkNaghcEiMC5oySQmxsMWw1J39cNp3wAzMEddGPEhskqKxjsI8cNoiqI4JD/s2D
	 9HAHtl7kfc05i+ZFbptWklCwd+vy9JmYUvQhr66hkOVqsdlIeqWv9R+wbpbF/ERZf1dkK
	 lf6F3XR35g+G6m6DXEq/OHov2iTEGu/az9jxETpgQS+DZGablCdCTO5qDWPnlC9kVtiot
	 FxVTQ9OJCrMIB85dyYtnJ9Xc11lXVz6lx+fL6/YkHHndnrWMnIWzxmHLkFy7Av1tgqBqB
	 HwArCYx/BOxo9n8Iy5GXnIx8XCehHO+Zdae6aNMG6FHAIksM333kqk8uW2NVGVnNT4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GOh2VdA7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AED606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75AED606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GOh2VdA7
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso5807a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:05:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795043134; cv=none;
        d=google.com; s=arc-20260327;
        b=NR6H5q/hAAnbDRyQvxEy9aOahHEE1sBLOxx1fGdMobjXQhT6Vl5Gp2GeVm0nGKrjJM
         YGVzqeYkn/dl8TjNHJOWhVChUsRF2OM4F1vXuSgeDYKAWhCMP8umUS9FnJEwQcSZCc6c
         5GkKphkv080oZp7iSjYsbQPMn+2wbDXyAaxVMe/+tVVcNvpPSP/MiVSFNpIe1bDcJGzy
         RAMlDLvQGOyXWw4l4+kZXmLjUydsasUxj7mwUC970R0ic0E5fjhbuDH8/604cWS2U4Eu
         ChqO4207IQpDX6bPiO91cOm/CmUzawX9H7y7vgaANcldkknm8B6VuNkyPaoZCPlO9Hfh
         3rvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCTbNVFwomUfL+eJ/r9dTAbaG7zQETK5dcr4yzGJzlY=;
        fh=ZBNScHBljIfqXtvqSTs8Ip4hDRwiP3t0sqo76U+WDDU=;
        b=TCMubh13IhFoGpjaUpCJGDLlzzGc0qvQu0S8p3v9mVHieL4BWdxvPTysrih4HasI3X
         WwWDfhnk6cVzS5roW9c6xBc2JwVae+NdEHrSOVAWl8bf3mKDjjZUfVqpl7WI1lUQiFee
         2mpFCjXhSobdE0he8SqYq40vOK3io+ER/eMasrIRT0jGaatCYZRzoSu4j7tFMFpAo7b7
         YhgUpkneuzGjRZNTaGTrT2St1gVDJsL83+oT8znAyqRL+EQPFSHcUHfXjkJjYH+THrvi
         QKrmIQdUVJLeohatozh+LNOee+9cCTkHL3p3UAj2LwmvomUXtIRI7PvwxL3u4HPOwtp+
         njnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795043134; x=1795647934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCTbNVFwomUfL+eJ/r9dTAbaG7zQETK5dcr4yzGJzlY=;
        b=GOh2VdA7pX+eHuSnndG6XSsqBaH6971axHD5KjJBGKakl4wIINBs9QqMdI61sc1QjR
         ZpRYMJmz44N1EEK3CYhslQdaq6cEwLIh26/7Kg5CrQwRo+QIdH3hphuHhB5v4JTAr2bo
         sZCtZhUSBc33ZHRuuNljdr8c8OH5kIxriv7vEQe25fY1IcnE1yU6hEpJMRz1odPQix4g
         esUE0KCKQEuFVsJeQiYqG7UCyGJEyG7zMWEV+Tw+u6YN5DDdq8af/tvGpP50e+Ys6j2G
         /qcmO1ZoJFD9nk7sY8CBWP2qeQO2JnDDPdU9nGP51J8HoVerghxHSCiz4FOTE+NF1lkf
         Ty4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043134; x=1795647934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCTbNVFwomUfL+eJ/r9dTAbaG7zQETK5dcr4yzGJzlY=;
        b=dk3ENUO6epqRvO5jq4AsmWHNgeXlf7/4+T9QtFWQQc+pcMckPgvB50qxp/seLINMjS
         gjxjF3ytdDaI+1CTZotPGosia/mBp5sScwk0oQdVKa5GRlPT3HnDmfzpbmiA+jexxqDw
         c4r+3kNuMenhXJzHgMIA+VbOAS0TGAon/4zQRKvUOlNJxUuh7oLuv5GZETkeAh8tH1cV
         QTaOzRzUr+dpvRvSy3+AkwpYvrLWUgkLaeVKBcXgJRbteuJma9hhA+Dk0ZtsgtDa01et
         D4C7bzj53jq80/yk3Aku7usSv7D/Y5DVtSm7LoGcpXLR7Ldz+j423RbFeMKAyKfj4jaM
         Edag==
X-Forwarded-Encrypted: i=1; AL+hErErpS2rhS5CoBuZbQTxmrpAB3uF9YJEQ6cpe2eZT77zniud18XnTK5KKJ3KByTwzN+wz2eGQXpUvhfEMNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0kCJ5Ldy+/zSIGvcSMbg99q0hHCsiowyUWsmaXmWG4uooKmxK
	LaAeACAz+ygZMulpI11v35KvmYAzJwtM9lo3UX/+56ghlq4N/fWL8OxqYwNTKUflKhUIB1LVd1T
	XUN/n7RUTGYTVL2VlDTR29iuefhgz2yY3AInuxUt3
X-Gm-Gg: AYBFou3vCgEcu4MW6HLr2xSRF5ouYkRkOu6YN28fwBw470/VkcmwxAexnfIO0DmDt4C
	CxAQ3qe47qS/96tuYpkUxyaFn4aJJGGtuqq0Uh+8omRLIO/zK6qAv0F7ZTbb7wFFtvgAFF1EBW8
	aosnzxnfqs1OOqVT5ZBZsdhwwqeOWDux0HmGFkVO8Rb3ROfrcksR/Zuy39+xtK8iSs+l6yD4wY2
	phIyQiZqGnmtL58FN/zoezTsF59y5ftF27KP2PSOv74EdHNKsSgyFw9e8RGRKAT6+/D4Ur6aZVp
	R5AdPNomlz6qSBOtg3xdO3lm0LGsWUNQOd/CVvAmjp55Jc5og1toqr7rLbstTvTVhfCa0QQ8POu
	Acr8Qdm2U2DFpkBpnpdkSFAY/2q41+hJKGDOp7ep4Osj5/cWiryyDa789v40NBlxpD2uHNVumo+
	x+5u6oJZ82Io8LCMKAoksXvCboV4vYl9zZqU/2x8zHdUlP7oHVNOJG2Q==
X-Received: by 2002:aa7:c4ec:0:b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6ba03730308mr28151a12.4.1795043133405; Wed, 18 Nov 2026
 15:05:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-15-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-15-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 18 Nov 2026 15:05:19 -0800
X-Gm-Features: AclHuK-SYB8IAK6eB4nGogyFLTmyTBaFT6vPSQiVW5NZq17xLmZCqU7xs_dCPY8
Message-ID: <CALMp9eTMywUdKiOwUwSw4Dg8Fgy9ZoRamthQatj_2ZqiERQfFg@mail.gmail.com>
Subject: Re: [PATCH v9 14/20] KVM: x86: Document EVEX-prefix not implemented
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> The opcode is already marked as not implemented. Add a comment for clarit=
y.
>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
