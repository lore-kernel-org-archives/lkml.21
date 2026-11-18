Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035811;
	b=dV6/864Gq4VEoguFqT3gUwKB3PbrdFVLVVgI6z9eD3HrtgmjAvnKWKaouhzQDfVrpSyn
	 W56EyYVP5e78CO2DVIJA0eU9vScM9sXJP4b5HCK+NzIwiN9lByn8BDdWykGzpc828fhbY
	 lKLjACNXf+N3xw/IIQ0spv1RBsPw+6biJQ22GRjGddOruF+hPWPpsKm0f8vtV0rFzGmCJ
	 tJtuWMlwOy+HnHlNKH3MVXadBLVgSndBFlrQdsi011YLcw0APsBqXOv1PV5NnnDRKKj9d
	 4vO9f4eVb7xLiWmp3Le0QpS8i16QXj8E7DF4uvo27GPm/PvhlauFW3eTg9J3bQXqbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=w0jYyrDAiZ6sNDtwFNEu2KIWwBGTIoWsrMaXe5k+QPo=;
	b=qORIChTKu84VF5uOB+F7j3xtYMHjDHWGCXrFbqC2fvFV8IbNF/eW7tOw5Go6xlgEXY/l
	 /f7MjmfbgKL4MDj/4aD7a4ejH/Lknk9tlkiOV62uGTjVOQsSiaTyN9lr8wn2g1I05PlZu
	 VTvdVTjytFBUWwzKJwSWNMzf7CXE6qVW2zK2CgB2A9A/6MN814Cx+rklFVOgfAhxWhQ1b
	 U8YP+kDgF0yaQa3nXcnjG0L2gEFG6xjFSUbQPnSUJpJ7F6U44ncpwJXCpFjgGxSrIXB7Z
	 wPF+jOOdIagw9Wq74EQAU1J+8xqMqKcJ4lZ2x7JoGBM8ParWOW5Bd6BqimWOw9ee9NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xbq4KvQu;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92926606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92926606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xbq4KvQu
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49a92144733so718130f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035810; x=1795640610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w0jYyrDAiZ6sNDtwFNEu2KIWwBGTIoWsrMaXe5k+QPo=;
        b=Xbq4KvQuV6fhATdw3BaCQSkYtthk+zY+Y0RxPPoCSYFlu5aUgbXP5sy6JWZDD2HPDN
         7+vI0HnfrVp8apUNp/nDrq6sxG55AmGhLEY150whxkIfFUkD8R7FHRvSD8+RRvsYTdtD
         OxWJ6JPzaIubVspnVIwdAkWCxrFnIf+Cnr5lqZmlUH3dqbJ9XSsRE6FCUM+qZa6272Lg
         Z5CDkUn6Ch4EoomWkV8AKi9dwSXvmR2N1dAlhQo07XSDy2JGjZL59GV9y8N/Mn8s7UnJ
         Rq6l94Dxk3tizYWawsWSvQMcssTNiMvRfB3w/0nh6CpBxlGXSneTUU+CQJqcwQlB6kj4
         /RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035810; x=1795640610;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0jYyrDAiZ6sNDtwFNEu2KIWwBGTIoWsrMaXe5k+QPo=;
        b=OahERw2A1SQgcLQvyLjgRvgzqFQ1qOfEndy3qnbzQfN4tgWShTa+XAllMXzSCYUvUT
         edjihmRidDGWf6sJTM/7gfZl+zSD12+oUllOjTszkQBRE6PaqzPfBNjdQMuPTFg8fD0d
         MpNBcUTClezd+7+UyLqUTniqxFI1jLb+hftQt4fPjFcM0VzPrLsdV4O/kU2eWDHxhR/r
         lde8noxbDaQ4phtLpoDQ7Zm+TUCaPIHImscGzpIOSC/U/GdCB9w5ZNXUNN6F5Thw9KZs
         BN1QQI/8ifjDen9Wa9QjzR6d1aVsiDs8FT2aPNg/HOd4gXuiStvf29wUdfULS3ykNswz
         cBUQ==
X-Forwarded-Encrypted: i=1; AL+hErFLIEI336KcPK3euavE576/2/7jRh9G+zWTAVUhMBt2rdo28t0v8xZb05gHq8pbnR+02VknD3RBKELqVvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bA1fAyAxrH2alOzx9rWiO3sMpZvJ3dhV4+jesfQsXSMCAU/Pu
	lwUhADLnO8hUMKrg1XJlSA7j8AI/1y/UhIXSXw2Oo9Xb+54FU8reFk98
X-Gm-Gg: AZFdTZd3XLgvmZ/7sa7tvqd77rvE10gbbPIU7KdFQQ78/0Ik9AaSHZYTUaeB9Nq0JnP
	euNpKQFhYAY1wS+kFOn7weNcw6lip5BlCuOF0lEjFVBZBy6jOrtV+D1yqa2qZM7wUl5Pa+VA2/Q
	RddngPjEMFPJKR87ogJucV1DBNm0krluoHIHTOwe3sQbcpHFzZafyhrqs9zuDG+8RVwIO8VEbrA
	hsBLQ2WKtjnpd9eulPGAd4dFwub5o7mRO63U2vMFLE68ZdF09VYJ0TWVqEthtqttlzhF80lXh7H
	JW6+GW0CgR1tPdIXF1hb+IwdvV+n77MIecfUOJcaJskK10qj+zHmUWxaDv1sgQRC7cfytZNRiSC
	melPpaU/HX9P5zk2qTS3+DRI9+VA6TZSj9egujhEafDZ3n4ysLwH+DSSjPQIb4qh8VbxAogxC2F
	3FpNL9pvrzpa5GXVpGUXyg4ln/TrCBSM0ibF4heTjPN0yNXzzS4fRPuT/hk2GxQLJB3sVh9rYpk
	l7oWWwHa4K4KMeQxX3cTKiQ7eICrkh4Mw29kdUeSyIn7BSgLU7jQOr25KgVYS4ETN/6il4T5o1w
	gs+8+3Qv57NBkwI7Ohqb8GvuBkFKeChke61+jCLZkoE1YNzKj03znuZahXA8mNaPP7njtEryHBt
	lCfoLNpVGnyyvn62t
X-Received: by 2002:a05:6000:46c7:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-4a63bea7098mr5034017f8f.40.1795035809787;
        Wed, 18 Nov 2026 13:03:29 -0800 (PST)
Received: from aura.rhinoceros-company.ts.net ([185.238.221.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm6137397f8f.42.2026.11.18.13.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:03:29 -0800 (PST)
From: Mark Street <streetster@gmail.com>
To: seanjc@google.com
Cc: pbonzini@redhat.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	Mark Street <streetster@gmail.com>
Subject: Re: [PATCH] KVM: x86/mmu: Defer TDP MMU RCU callback barrier
Date: Wed, 18 Nov 2026 21:03:11 +0000
Message-ID: <20261118210311.103455-1-streetster@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <av4Mlz7fOP-EeFA5@seanjc-mac.roam.internal>
References: <av4Mlz7fOP-EeFA5@seanjc-mac.roam.internal>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the review. I've been sitting on this for about a month,
waiting for Steffen's file-based-reference-counting change to merge
before sending my patch. If someone has already posted the same
RCU-barrier change, that's great; I'll leave it to that patch. You're
also right that the stats/debugfs .owner changes are unrelated and
shouldn't have been included.
