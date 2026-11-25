Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795577230;
	b=UTmeFCn+GjXV6wGpGbJlZxle31VMnYtDo6VffTXo9NLb6KWUsyzeCGUIYqgNiktVSUqf
	 UACtgQ794c/e+WUmuciH+O6ls/LL25j+Ay4z44kgO4pVitINIuiX/PmojVIf75U+cXjDF
	 wLrPg1qrry84vAaxtt1RoEszLUBeEvCo7PCgaLJOo7OYSUXLQgGp8ZsHxib2tDLGApAYe
	 Z2clEPCnifymSR33iQg8Zp4dDsmHYCDlPl8Bkelr+TdW2Sb1BSOS9OPdyV4t+T2YFDyc3
	 1M+HG4biJUhBw3D83au1KW2Z/uvltNYLXG839vbwsCLLibnYZPvSXfHd/3xBthOi9fQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P7lMUsRJHIyWY4eUPhk9XWH72UepBgyY8amhEDGxgT8=;
	b=gaGPxT5dayxPpk55ji03aFwXQA0TgfziAfsAM8Snmm0634GrdPtgvsv798joxAm+T6T7
	 jodrrtntBsmv1oJ8l+MHv4aeZBNW+Yo541pX4n4shkDDZwOHqgv9QlvqQq5wZHrPKZhwh
	 kE6gBSgWSHbc317+Oqcgcey8CYRoj+0ePVxYiWMeZs48n54f08yv2FEYu0u5te1ulLzU9
	 hXWbojpFc/DbGPAoTwgCQBVMHWjevci0ITNTTeKfv8tRcFXeIldnr5x41gs/163JZll1v
	 WWbdio13TZHCjPT14uR5LppxtQFYPxF0zyfoKSZoRKFT0iVDMNxwcUcNw5l8yFrrk3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=louS09jN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD0606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCBD0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=louS09jN
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380c28f9e35so6438916eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795577229; cv=none;
        d=google.com; s=arc-20260327;
        b=ZFrwc9eL8Xx+cwLBXeUK1oEhGlAIrX2I2/xnp0sDIGZBTB1tFFh2oa0WncgGeYPvOE
         CiHewUlCnYMq+fEcyyLmQuLUOepnxMB2M/sE0K0sq5NDbJIo2Q1QsWA7HFtgFtdV2pd5
         JUayZMbgHc3g/bvYyYKUD5ME7wjqUHYDWM/k5evG+4cjEE5iTcLh+jjElXV3PnDfuQCh
         0cAzsLGe0JzeNNEgN17mSRsr55oztbMdf+zay8+qFCWnn5nOJDteTY7z8yn/Qp4jNppp
         A/AdJuTxPxNJDPQ4Oo8Uvw7WZvhqhjBehge1tSdShPRbcrQ9aHdqYl3Chgdqh/4meGIM
         uB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7lMUsRJHIyWY4eUPhk9XWH72UepBgyY8amhEDGxgT8=;
        fh=pDZdXm94wBgYDodcyoid5fa3d3Cb0/i0legZVwcrwZk=;
        b=LB7tm45AL6DDvLgRKwcz+alZBSy/cyVdc139+qaI/PxBEeIkCW0uzjEohS98Bwz+ES
         zs6b68HSnGOGxK1eOVfpKZBdvEXAFlKlFaLTIywp5TWdjDrI8k24qmQR+KGszccI4/n6
         C0/u10F3Uda46hiz2+Az4vHSNqsFxS4hP0XRcwF8+tWGwb3w7gfrRxobyBfO+dhg9l/o
         difqHvE2nTO4x9PUr1kvabVrKegxuQl4XsJSdMlYc6bLWUXhVTtQnSZYQOsIcU+IjpW5
         1LcPbh69E6hbMRNQGh6FEf4XSSMhP4RCe40RaXuSyvyiydthSHoFqCUBO5zFzlH1ZHQQ
         qGpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577229; x=1796182029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P7lMUsRJHIyWY4eUPhk9XWH72UepBgyY8amhEDGxgT8=;
        b=louS09jNI6p4ruo2YCIqX8GKnYrTLcjhTq+Ud/LBfu1g1oa1nBX4C+SyCNkmEV3HXM
         y4aOjVwso+gykF/PsiH/IH/HJ6PD0BN4M3PjGtAVzMBkJVy8Z7ByKs+XnEeL1MTsGVb2
         kECzDZX/0EayyLWWvdM5RAF0YzzdZ97jVdHkIK4DQ66OfrA1HpMylUc5Nn37Vp/HOY0j
         AfuljYSu749pfpk5DHUY3h4dpJIEaNhId3QLvZTAkv0cI6n6vbc3lCJJmqoryVloE/9V
         T1LZbEFZ1GkZWtzazaeu0IPUt/XkxyRACpA0HLfsSmsRq+d9vT36CWEpKIdBjQlfASZP
         5aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577229; x=1796182029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7lMUsRJHIyWY4eUPhk9XWH72UepBgyY8amhEDGxgT8=;
        b=oueEwaTcgarm0/ybYRrvDzGflUSlH/7B9JhYnuMzStTTSjk9vrlIfdF9T6AlIK8jhV
         iDvAW0mLOtnLOffa/lFT8yffNmogak0pwl5JqY8znQPHrz8G/RVmmzmc8MnhYsBZkKg4
         dFuW0SgyaXCFkg7WBqpYJ1xlhfFycFF/Oi/FNsD7/cu07aq0qIoMrbzKg49IieyiZQVQ
         EE5VMdzKhgdtdBKcb+mp67fBNcOZAVHe8/er6wXuGayMKWgcasPUjnKFcLmDTQetCv3u
         G4w6TKcZ5tEI8Jo1JKEINE/5U41L0joyZFdwA+wfR6vKpIdnMbRW8ozphpm6/ryzt6s1
         DSWQ==
X-Forwarded-Encrypted: i=1; AL+hErFwg9WB198Jzcjj3KPRE6ZEdh7B+ck+gibKB+E59qiEvKv2332oHt3suGoY87qvM8E0bOERzmDahB8Xrt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VXq31enXr9diJWGsrcAFvloIjY8zW2h8nQlG2YD8nKQ+dmqlL
	/iVcLZM3Mn53ZdRa1gmF+Bd37CZaN1cxjrfRf+h9ly1eQjrjRGhaSNM3puz8gle6DOF7qVUzUJ/
	/vzWbACTSSzm023mEqrP3B7k8zXrxYk0=
X-Gm-Gg: AZFdTZeN7cz9boPjxLMbO7+T6DXZXU/KYZ1vxSXcn+sQJOTK7Af3p6oWf+cYbh72te7
	AADIzaA3kUBE+TWSmisBwab5MFFB9xrFCMVO8ppnk6qQ2dLGNwvXeU9LIEXNpgG6T6RyIbcsCSi
	TrLoDFM+wXB/4AbfhJSlIglWEZ1FvDr4N8FeYNbafWXq+Nr3xD/QHoXsvjxCDwh8mucA63DNv5e
	37bQEZLMADTw9NHXYScn0+6iCr8dK5Qd3yyx2sb4Q8Y2xOJyZfhh/6zu/JstGz0OqoZZu13L1DQ
	3yATqkYSiLEWYUVa0gmGIuCrNLitd3X+9+U20axSZO+WfwZlSr2v7sYFlW4cfoNdUGPTsNVJyaT
	DMJ6LXsDkIOdVthoHhgf59EjoB6h+fHmwYBH+Pw==
X-Received: by 2002:a05:701b:2704:b0:1ae:d447:6c84 with SMTP id
 a92af1059eb24-1b5525eed02mr15437523c88.19.1795577228861; Tue, 24 Nov 2026
 19:27:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020104710.2366146-1-dolinux.peng@gmail.com>
 <CAErzpmtcDUu6dtQAvV4fJTuDyr6YqtyrLi6XBjWHLjxS55RTYQ@mail.gmail.com> <20261124093450.555bafa5@gandalf.local.home>
In-Reply-To: <20261124093450.555bafa5@gandalf.local.home>
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Wed, 25 Nov 2026 11:26:56 +0800
X-Gm-Features: Aa3M54ru-ggnqw5_XTPc9MBp9eK8ndWvb9TMiJ9Dy_P4lAOFGrTXvuc0AtGBUFw
Message-ID: <CAErzpmsGh+7Jt71=y8ygLv2EUL_J9_j3Lbnh1QZZFLxDcwhnDQ@mail.gmail.com>
Subject: Re: [PATCH] fgraph: Format error pointers as signed errno values
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pengdonglin <pengdonglin@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:34=E2=80=AFPM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Tue, 24 Nov 2026 19:07:55 +0800
> Donglin Peng <dolinux.peng@gmail.com> wrote:
>
> > Just a quick ping on this patch.
> >
>
> It's in queue. I have 153 patches in my todo list and unfortunately, fixe=
s
> always preempt enhancements. This patch is more of an enhancement than a
> fix. But I'll get to it.

Understood, thanks for the update!

-- Donglin

>
> -- Steve
