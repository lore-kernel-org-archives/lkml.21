Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706701;
	b=BM/KGTxMTm2SbFcj6CUSgIDRlWalssFOS9NfWkfBjpPAn4iQZp88WCVljKGV78KcyZ/K
	 RK4Euc15ikU9rUDT5BEZeP5NLuEApHpGrojgK6eTgkUPhX68W8KJtwkOi+Owu6Pg9Y5/r
	 TMiZDPm9H0oad6ozYAQ2uEWkYKq4FeXIb+6MtXcEpRO4QUYRp2cKigXz5H4hBzt5kL07f
	 oMyN455cMpKY0W/q6h+MhYVY7WD1O6aNvL7UrGC/TBHs3iumyLyme2rmHIa1brynv1J0j
	 iQYRCrWYDVhzNDJhHVPwZHPtq4cd0w4U40yohvIjj8S+EurkejUA3+pSd2yKR21IqIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xn/JakdLtzzNaeEXa2XMzMriecmeUnUrG6zt81Wp6lI=;
	b=yFiDqvxzbv8aqE26a2CvUaMxkC4r6BZ8hlzu2Yrh+JDGd3yqWSsLWwDuh9QqvQFQ5GSo
	 2cZ5gxylE3lZwlbOW5Gc/2D1+q5RjWKRLb9C0ybff8h81/7HMwJ7VgT4nowzQxC7gtxuZ
	 BqUt9PY7rXq3vGW5ey82Itt33X/2fKgIkxXuouMxgYXeOgjDr29XA8EXbwoyNT9TVIp4K
	 z2JP1o/Wgb3s1HAGRMznJpEqquNC9esQPpiAgt+Fv6XK5e+3jcs66KyuipS0B0oAmyKHR
	 9+jKGJNOU0uw/uyFCx+TISMxuwjXVqUficwATL8zpxzT+rO8mk1tHs+SGVmTdDVqBqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mn992LY8;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347B606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6347B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mn992LY8
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f03920c4a0so44963975ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706701; x=1796311501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn/JakdLtzzNaeEXa2XMzMriecmeUnUrG6zt81Wp6lI=;
        b=Mn992LY8voVClIyMUG0WWQbZNfWulJ61mjwP5Cku6NprsywIVg5eouVIzAKYkCG5H8
         4NRgM4NC/AEmumt+C+WnTdxfw7ZlqWHyPJZxBHhbzjKjwuFrcZhMyncZbet4cgmX5HSc
         7EBRPqslrcFgEhF4gAI1FKwTcxc/eQiTSk9tM26SP25KFlki8MGjUc8f0PlOLiYI/Z4B
         hfXT5LyGs1Ud7GANF8lQO55yADDh+oQFhBIu1PZluKm9gHNiULRyI3pW9ZeUIXz5nRxW
         +tmf4Icf0r2nDWYsIYUHfiaqFNsjmSOMmPW6YyJcfb698r6LQFLzmcrU2tLRVD/rujZq
         RTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706701; x=1796311501;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn/JakdLtzzNaeEXa2XMzMriecmeUnUrG6zt81Wp6lI=;
        b=RHVQjucgCFwKDLWrGiMpwezCsbpzhqGesbZrBIczAMtCLke8fHHJnWAaakIerNT8Gr
         I8RtLrM5a/Gm9Uu1v8/bjUMhb/NrQmTxuJ1OYUGSCOSdqn73K2f6UzR+3IcwH6u8X/Pd
         mAmVDlpapN8g49D8YwRm+n2WiJe6JP80D4fdMVkE9oV3+wjdYs+ygivRhft6mxdZUD5R
         2yGxxVWrcV5qK+0m4FolhigtPuBWYzsxkmByuwwj06D6JD3VtB8IHDr0Bkvf2FXb2twh
         lVyicwOQQJjbmkazBmjukp/KbpRlw19fmFfi/gMzUatVWKi5FXTmZ4drMTHMw78ZW9ki
         v65w==
X-Forwarded-Encrypted: i=1; AL+hErHI4/8mJGEpJ7lJc3+G2JTv1ROJ+dRZJYxWjMlTbslZunO8PtRBUQFm5Xy0sXDiKfQojbsYsQQGSvUp6po=@vger.kernel.org
X-Gm-Message-State: APuU4Z8awABr1kIRUSq3rjkZUlkn1l9t4gW2UjCnMOdwGNS3Bdz1VkjF
	a0HQ/qZ0/7MzkZ5Fa5oDJEDGTGGspur39HogB/zvyklChB4QiusA3eNu
X-Gm-Gg: AZFdTZeRnmyi56gtQvb8tfJ5irf4w8Kh58T97w/LdBrPmKE4HK1jmth5O+ZKobtutxw
	Nixk9W700H2srDZVWyfBrwVJD0Qg41sWjcvdxoohUhPd5D7rl4i2QfbdbO1l5mQFanWNMn1x9zU
	0a3HraX6hZqd6Z5LSb2rn7UcjXj/VnWhTbJDjKSDKFMjeQmejfjmGB7AgFGCVca6VhwoQENqPdl
	vdxaj0Z6Dra8rb2Mr2+yeBnyikhZHVy5AZggkRcdk0Y851CKAXaS6iPueD2QBZGulC4kXlsM3Yi
	kpBQmOm3oEWufFfOMkD61dv7gK2P4EWTSbyemQ2YZINtxfi7BSFkSebTz6bwzr/psnezb4+Zz9N
	K0IDw5cQswK9nsWIpcynSZ9BgTsbncmtiI5PchQj+CvRx5SgNZCANBcYDPsjIwrvgsLk/ROqDek
	YAXy9/bbMFUVCpom6+/NYQXPjKLA5V+QiUFtps1F+NN6PiSUnuCpeh1f/33v2a16RRgfwKMliP0
	08BEKH3pbqcGFqwu6OeM68IK70C3mlPRs1objEKvf6ci0w7oBa5vM6PRhJfvAbdYablBX7vwZZn
	ZpQxoHSPWG4BDdLxD3u/ABn2ivbj8r+FqWL5grH06hTENqtokqIL2fNdOjVRZjxjI2yxq16iGpW
	I0VY5zeWrSxB86KODd2HHnWDk1WWKGm/qxUHuK+6mCzh1XJ62LItwvLPB7qWvKTM3c0H30yun+b
	ewnhKBtJk3cocjxgYceU1frA==
X-Received: by 2002:a17:903:298d:b0:2e9:740c:36c with SMTP id d9443c01a7336-2f03f1ba67amr211995255ad.41.1795706700672;
        Thu, 26 Nov 2026 07:25:00 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04ed9620esm98281065ad.26.2026.11.26.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:25:00 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Punnay Sharma <punnaysharma805@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: don't warn about keyboard backlight type 0
Date: Thu, 26 Nov 2026 20:54:48 +0530
Message-ID: <20261126152448.847538-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe>
References: <20261126073107.765676-1-kapoorarnav43@gmail.com> <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe>
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

On Thu, Nov 26, 2026 at 08:15:50PM +0800, Rong Zhang wrote:
> See https://msgid.link/20261107140700.16036-1-punnaysharma805@gmail.com

Thanks for the pointer, Rong. Punnay's patch fixes the same warning and
was posted first. I missed it because I only checked pdx86 for-next,
where it hasn't landed yet, and didn't search the list archive before
sending. Sorry for the noise.

Hans, Ilpo: please drop this one in favour of Punnay's patch. I'll test
it on the V14 G2 ITL and reply on that thread.

Thanks,
Arnav
