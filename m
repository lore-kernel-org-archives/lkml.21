Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045699;
	b=EItSwTHjsGYSOvysrL9rZX5qDZxN97oUGoLfl9ZNP2ggGvEBr5N3SfCCy1Ul9pm/u1IY
	 5PVWmewPwWq0sJLC1aDwlrvfooYi9VNMwgIhSvqQBcCH3hxsPD0Ti/UOd4bTuvIPXSiId
	 PYXSVgYvW7ZM8x8d5Nda1rVPHmTB9BEHwZGyL2KMrZRN6kF0Xs5PbujJehSkbB8/raX0p
	 DkikeiWEcxhEYS4b7kDEhGPIDMTAw8ifHchuQbzqHYrx1MdGcJ3u8gGUz0wj4R4uKRmBV
	 mwt5w/+j3agdggRUEJ36r+nZSqlmkakugkwvxL3WEkpplFljzXYVib6/Wxq/iutr41Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
	b=uQOZ7Zybt1DmBn9IZIOiYtwF0BAWTnHgncukQTJbcbNt1dLUaoynLy72RXZClK7GEmtb
	 aXBJeCXO+PPXk+YvD7kqr6foEHxdL5hPFWYJoxDlKY3QVGl6dBmY0EcH0ySlIeU2M7Ydf
	 CHkxTJ/5C24XKqEbznsuT1aJTIdJCklqq7hEnUThoydeUALtn0Mi6LOAK6qyKjTz6NPo8
	 U4whcM6bq7o3DU6iuQI+N5PcVzFszbad0Myqjg1sdXYWKxkD78ax/j0TS35UTwpH06h8E
	 iO5ms/rDOGZsaDe6JQ2YjfFsUXr27KpMqaoAezRiPNTk3YOWSaL9MLJZSsjJLlC4P2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYBkx8us;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB6B606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB6B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYBkx8us
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2467950eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045699; cv=none;
        d=google.com; s=arc-20260327;
        b=IKkSR1oyvtB0T70DmjAwO8YgFYOHxZUJKkvBl2hoztbsCd8SCYeDSZyiAVmVbcw9SD
         6oD2s2UuQvDJvq4NUZ1+Q0KbfXsRKxvDIQhxVBoObs2UNrr3ONFz2fM2oQQfXQCaHv4B
         JYidIhxmO36UBNE8EEaqglOlSctYrvbewrMrxn3EM1vtPWx84Jd4OARWo16trQphkSmH
         7raj3quZuFZsS4vG5/aSCUZ3Nv6zaNFpVvQDmsNsMF7RBV0NzBNqByJo4i1xdJiVPwEw
         RX63wNhWbcvS8yFO0P3ABBtMRNUiZOYPTu7PRpDXph2pcHRtBVeSrvsc1BXIyg9p6zbY
         GZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        fh=gBbGykerLSbmq1pZ8jxi5y2DfvgdAvZ4HHC3OGWYYeA=;
        b=ByRXQzUAZD0TY59KYroyd0qjM7mimFgme7r7CX3FlonUaCGPqSjMxoQvzYVoqAsyj2
         DZZzUgxny9h3xPRDXmOlS6l+Y9JZIQOFnhLs0Ajtm0J3gKogjDH0Qd5uaU1SH1R0ibc3
         CGFxXwdKEm3IeK7ow378sAbMLpMfca9+AxXs+86Eqz4dGhDZQeGLDps41WU6o5moBs/E
         eIl6Rg3ZeL2t310su4ORDrF/WfRBEAkU1Yzej/amVBi/2pq3c6utKQ/LpaThpnCXjPA9
         65cDZveC3ugTcL4eqUsce3m+I8gTrMgybex0BVQikY3AWF2Dv9c7InrXcvlECjLmvW9q
         8nAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045699; x=1795650499; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        b=qYBkx8usCC08AHPWPC4qIYdkng3T2Gg1i9lu7IDjzAA+ByGAjaeQeddOHoQBk+6yTM
         b2t4VG0/8OtWiYw1e3z0DBh0UE2hIzg/eCA826Pp10ZZIrUjnX86EeJD7tyQcDhthkwo
         +4OqXT/ZL0d8+iGG1/WYb0j74sKipMw1NnlRZW9pNZ+g8ltMRp2ck5hc30sghpAZt707
         Er42Z+GpUeSQyyXDV3zLf9CyT05UHWfHNQ3/oP6RFCfxceibFKk4uVVWQ7XIbhow7Kvt
         Hz/EV0VJHNZ3Q+leOu6eFyaAUYZpSs0BYeWqhUTcRFjWaD7jaf18sVjCRD/C4weZ1lD8
         rtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045699; x=1795650499;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        b=JYNdp1Q9xhsZom7lxvXSnsPRXeJlHuUtvTF7PqDh/veJJUqbntdZSnxS2wG71+Aa2N
         WYe+TdQHyr9wdkipiR5FYJ8/x3kNffu01AC/GD2ogJrbDzhYafNeBONKqmRGGqnO/plB
         PwqQyfZc8iVRJjJFZ69b5yTYv5rqsDkgWc0Sp5rw94DHRz65gQuSTRIpuZGK2U3xDBZK
         Q5CstE0PvZzV+j3Uaa/+n40fAcPjSwUuL+bLwF43ksbhNddqA71C9tfKGHZQxOmL+zEC
         bIK6+q0ZUrN4whHCoKkv5QhO+UjMQTXHm6wjA+5utkfk8K5NIGDS7iPYhI4OSLBsB+6K
         NwCw==
X-Forwarded-Encrypted: i=1; AL+hErEKNS2fMq4+5IAu0Cvc4/HNDEPO6af2WBA1eC9EOBBIaLnnPRW3sJTMOhhMqCr1FZd8IuYld7Z5qg+fzeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aWz4Yvv3osU7YKwACHMPEtz7o+Eanw8B7vXR2ENEP0ojF+fsu
	lwtsijY5VhERZ9wwGgvYGCXPevJ8h/wVIdM9KEjBcGSXNNP+e2A8vdwkZ3np0Gg4KT6n0UekSso
	76DWe52TrtOey8vAWubHKCZ+Hyqh5pX4=
X-Gm-Gg: AZFdTZdA2MVx2PIOSQQqMHE6OffMzCL3vXchHIidb7pNKqGV8irPIVwh/xw6Gxy9vpy
	cKAOOOyDxQ2QzFtZSQwujwnWALvwcC6R8fPSs7mo6a8MtaRKHxtMbMpKiNAwykwu5nzMoAe5fkU
	GGOmpUmOjMUyweuLFi6NGH0aPy5mQGirHgcNbEHaZM++bkpKER3jjjC4HxLGye/yMIlfpuJUz25
	t9Wgs6RqXyG0LXEq6o66G5HMG9axWCrztOcVADgBRZOkgj0XoP/QRHk3CtOJ2QLgTgGujvyx3Ns
	mAV0aQW5MO9H1x8l0ZYKHlyyhVhkCm0RPipgvSEnYMmVFRgDp9wI8ZMXnQqXrWIJ3l94DFunvZl
	eAxLPdiR9N9w01+CF+GSqG3qBdQgUHKrTg+Ps2gJPVbWrgYmbLLrDvFB7qSbvdzk54In4JYyKNq
	RTjmB6uhKGGQ1imPtZpg==
X-Received: by 2002:a05:7300:d210:b0:380:f8fd:d19c with SMTP id
 5a478bee46e88-3828181369cmr4316220eec.35.1795045698347; Wed, 18 Nov 2026
 15:48:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com> <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
 <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com> <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
In-Reply-To: <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 18 Nov 2026 18:48:07 -0500
X-Gm-Features: Aa3M54rd6z901o4jFDdX9BIXR6e1rb-3tXX1SIFSQ_6Oa5HFj9_O_6QAwqOnrbg
Message-ID: <CAKefsHusjRX+jo4DAywmVTEqn_Ypb5VUBMfZq2VbsEPNSeTq6A@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Wentao Liang <vulab@iscas.ac.cn>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the explanation. I will split this into two patches and
send them.
(I accidentally replied only to one person, sorry for the duplicate.)

Thank you,
Changyul
