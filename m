Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795067781;
	b=RAEBVouziwleytt493Y4toBRvbYOwtguyTK0KzcLjkLea+TgL97SXz2RI9+pOUKtqP2N
	 JlFdypKE5vlEbN1rYA/F4prqGrYCRCVdMzEKBqNpQkcrjEfWFeGvUPsyvCSu5rW/vas+j
	 /Jv/AdyeXtnvIwtU2DCpa9P075Pg8f4ZiAxFgFpEljAiD35xfS/HoYA7kt/PVqyGO8gk9
	 SqNk3/ktmF7hnofgOYhnoOu5HM6XdtPL5A7t58vZWbxEXE1Vh6uQUUCGHgDcSFQCzRiqZ
	 +ErUTUKzbeUpr7woxiu0FG4sC6js2VMtKDc7rW1w0fL1H6YgC8dN0g8vI3YlfL4TpbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=xKhWfAhnFH1MoQBYnntrqmndPCEzikmuR8uNGBngT1E=;
	b=c4GL2dYmkBeUkA9nEIevC6N+2kasOdp01X8u6bMuSDOCbL5LuGa3o8WD4UeUpM5UnrRM
	 BmOPen2WZ7LCW57bxBWQk2bV6lWGQYK6gzqpAyY1/Hz1WVA6boNu8xCTJtvSZgJyvdUbk
	 Zf3Eknb+DJhU0eFT7sb0HoRWHgtqxt5cgSlpkR6wPNT0zmoOZ8njVpIt4apX1dYe2N+QY
	 wSxBIYObYgMXvm+0o+QwyOLVy6tS6zYokqPjZbW0z1DEF+tCwuSqmdQl5+jcEI7NWYyZo
	 k8j6dCI5jLDVSKYA3pSmJheerCHDdgCC0canpNytvRgrYbGiVMy/JJH/leWF70JuErA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gp19Jox6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F225C606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F225C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gp19Jox6
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so2401465a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:56:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795067779; cv=none;
        d=google.com; s=arc-20260327;
        b=G4sfP1+0Rm/02Zfy6/i18FW9SYo/abCRWLAF8zL1zUIRCQXWKc3x8309E3vpB4E+XB
         BvMvpf2PdWvFld92hQH1cqbPBH2Lf40HOUxmIHmN2ROcstIYQWlwP01bwAi68bwflh53
         8zaIccp5tkwglVHHaefEWtgA4gAtHX4QnK8IuFjp7yLIML7a+Lwk8zlKyO+4mEswmSFs
         sdqojWu07UDLscdT0lGqXVES4TzE5J2VneuRsa1IUhCZP7zBKgzwo3Z2H0+SpfeYtb5H
         pesNLa6MVjCYnzoy8S1AMd/KSyeeg6H+WcdgNGwbdxvKSP+hfjFm8ckiJt6YGvhM1t9X
         3hAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=xKhWfAhnFH1MoQBYnntrqmndPCEzikmuR8uNGBngT1E=;
        fh=AACs8PAPlIRPC9UwqKaU3AAWmvQhB44v+4QTs3jWWac=;
        b=TovMPP02+eSu6oYyz4gqli2wd2fA5rWZVNUkrfOEh7P2hLHyVBBJMm5Y8NhL9AZcNK
         KlFRLMLjOT2STtgMo3g+Q4qfSVEpxFqDevUuvFs8kH+apo7PDAvsY6o54yjkkH1VZA4o
         H5ASGHwtujyCYaJWICvPHsNFfF1l1kfWbcFQI5fqM2f+Yi0sDyoK1Ia8RnMlSfFQWK5e
         dEBR6AnGqmm/nDrDKOJOduBOMH2cDVmXaqL6b95DHCYSPxfO2HVhZ040b4I1s570vU62
         F4hPuu7YHdV9j7mqwxHpssyuogn/rW1fsQnmQPT9+wIDfRgtUzLEPFpNYy+p0uCrqiGv
         abew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795067779; x=1795672579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKhWfAhnFH1MoQBYnntrqmndPCEzikmuR8uNGBngT1E=;
        b=Gp19Jox6nlC9RZkWxZWAYNWjJFQn+GIAfGYru2VmYt69ZJmk2OqaT25ngUDeEZoC3C
         jog2SioSnJt5Hy09NXwu4XCu/RpcGtxtHncgjuJvdtRW1ciKKbFX1HgCSFvS/F6ecoRC
         iTNoX85jsdX5ZVpsZiUQoC3CAxwbq/VonYWY5VOoSHl/9gT8UQxANxrqfk21nOHfmkcT
         ndP/hYhRGl9/ncMMyGU5d+cGVorufvBpmMnTEts4Q+Kdi/VsPlJsbrY7oBIwk9KuEE+F
         NIFmE9ACc98c4N9fh0A58pNT0bWyEbmJJXvY2n9B2dywExQLAQHrdgTd91rGFYbQFQlS
         mIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067779; x=1795672579;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKhWfAhnFH1MoQBYnntrqmndPCEzikmuR8uNGBngT1E=;
        b=sQ9IgO6V6iW7EguEtuw3vMAGZy522MXyb+W9KNkBcr+CBdzof5ynT2Bss0cTGR8j2q
         jDU9uIz65c8ZTSsHooUf1mbj7+aYcaiXqAsipHQAPZ0MGr/xjARC7nmGhR9AD130utI/
         7RbkNmFtdyAHaE/FHqEHkd0nZKIP/YdAwSa2RXcDDodHUMvAa4Qt4rFBfRQ59g9uSweg
         ZJP9QbEKu/Yu8UPH0xnPYpOxWJlQFTe5opJh1ANbuRsVn5ooNKWZZdSBm7360M/g+wj0
         gM12psTzp3KxsHLMzYZA2gXvasM6/tiLEtLr8M1XE8ugoKxsNZ7PBuApKyjEZiHBfCey
         4pJQ==
X-Forwarded-Encrypted: i=1; AL+hErEBjksh5OgpOxk6ArkxB4eZUNXYL+v2h2oOT1ZbSFEFNfHSPYfmZbp1ZZk9K+IGBhDPq0g01ymEzCf6E5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E5wSUywajGqnNN52TPYeKF5AbT0gecbhAm/OiznI+a4Op/Hpq
	sCQnSpcZqJdoEt7zVdH8I2m/cH4ZK4tVXSA+tMizNLHVkLGqc7kUyu3Lc2dWYSNKKe1RjT2bGx2
	pKnMPvqpEk49tHM1B581TM+y5shMCzQg=
X-Gm-Gg: AYBFou3Nb6bjKFXxNiOIQmSPNUYhvLE3WCkLip54z/2O20GbFcYn43XvHI6w316nP5Q
	yLoj8wZS8FaLLIC7ntBQEfYcVXA/UklYOfibLzY4C72QhYxOUP3kmfwDsqwQa7L2DvA29ls7vwN
	mqFjdbzCbAK/UmfJ5jDKl0HiWbX/1qqvZSJoJShHw+rVz+CvyE8uQo0NHHG26pkdFSdrzZ2QO1C
	n+JMFA4BFbVJqPcjus3rKob3wm6hnbHNI0eXgIBcKCzww9R5ltqcNSSPSfexuMJS44RTeKJUHOg
	ZGHMVb0pPNxOmi7PwkG7EJaMdwt0LB0EWISBR1a7KyY+9M/tfuyC5g+aENRmWHITb5Pj4l+h7d+
	UFCZOkbLz9RbfQuFdP3C9WWN3cQFxdxAXmljGyxRd2DeTswsMLrE0dkj9s9neQpJx+X5sJRn8vN
	l/N9A/fxP2oZXB8TFrTN/bCSjVdEAVE9CB5yoszz4VNomPQ9sYeepMNRE=
X-Received: by 2002:a05:6402:4285:b0:6b7:a5a4:7205 with SMTP id
 4fb4d7f45d1cf-6b887eb1fe7mr3974112a12.12.1795067778960; Wed, 18 Nov 2026
 21:56:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Wed, 18 Nov 2026 21:56:07 -0800
X-Gm-Features: AclHuK9LKYVZiEsZnTp2j0Cn26lMdh6iKrN0JdwqU91MaVZZWGmReLPcsSb0KYU
Message-ID: <CAKSQd8Wcw-DUR_JO9YFw17u691gjNyvySwfhPW_P5P3ik=_tBQ@mail.gmail.com>
Subject: Re: [PATCH v9 20/20] KVM: selftests: Add APX state handling and XCR0
 sanity checks
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, jmattson@google.com, pbonzini@redhat.com, 
	kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

> Since APX repurposes the XSAVE area previously used by MPX in the
> non-compacted format, add a check to ensure that MPX state is not set
> when APX is enabled.

For the sake of completeness...

EVO processors do support simultaneously
enabled MPX and APX, with state that does
not overlap. (And several MSR control bits.)

--
C.
