Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021194;
	b=TVDPeywVYNC0c599EqVoEGMRrwwpcyFkbrb3mAjyk+PjJqcaCaTE3zh4IbUMNZ0MtgCe
	 CbsRdJoD7n83k/oFPGbUPWQH6JlJEldrX3XKkk50f0haM3JujZjJpMYV6g/HNZMfcFTlf
	 oNGUlarkkgCVxmJH7/x4x4cmbcNlHhyzwdzZIr55n+DKK0KP4Mi6HtMsm7t39D3RWJW4I
	 Ln3oQVyynbWk7jTOjaTm5EKxLQf+fEUB3o1eUWSXSuC3aEyELaqSDBPl2fzV6F/H6dK44
	 tualcs3IspDc4cMxzw2yInBefGChdPKBrPkPx5N0S9E7/Z5gVHsjrLNTpJHEoLDhjzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=SbTYA3WWftMVrKmwOoy/6f/vZwikSAfbNlm4H6PwnQU=;
	b=APLWlIXn+4OyjOVDZhMuO6wiMfPkiMRv46J2W9zwQA9DNYDiwHJYu8or8T5Quv7Y3zpn
	 wia3eFMWjXdk0rZO/QAwdrUOyMdgiKiLjjyD7+fmcdLqA1A4RrYT3owmqZ78sMubYdPRt
	 vOOGzeKuIuV2ihFogT4mbhZHtWzQBfbzhVK1+D2CgSKOv2xtGAmYSSjb/pwuixndQjzc2
	 dymyUxAqcFeCYOqwxDxUdGqm/rAI6mzVlr3tbz7GCCvCDFi6/sBBui0CP5nLmwMgHLt/S
	 kjFtNtGhpJ9TD/lcmAkSVXigKTYWTh898OS2xRjBx2we3mkl9cT0GHOdEzWWTyJCXTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kP1Zp4Fz;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031BB606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031BB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kP1Zp4Fz
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1596136c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021193; x=1795625993; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SbTYA3WWftMVrKmwOoy/6f/vZwikSAfbNlm4H6PwnQU=;
        b=kP1Zp4Fza7LAQyUqypyaAhV6hvS9maeBk7Ez9UkDTkcZ6p2O/rTm6xKsVwXHm7wtIb
         zEtJ0jOVT3ZAXliTLP9x6BrIYgPZCPkAzJxPaq8QHVEIhPbBwBFXkb8aXJcs24Z2VdlM
         gh1iLAxLii1REJ6OZET4tUET9mX64x0PLboP/yTa7a8DlN6JQ3H07z2w3tYlNHcLimO1
         cLLjMVXqxxxdZkD8NxRqLzrVL1POMyV6q34IRykX93wr1SDiEVUnwvcR/P/B0triLpiU
         0C4PX/abCPLLNCC4Nj9zC2jBnBuxoyJbA657l0QdC5JuFqImVK/aGtuyMtLLNrUELBSh
         sq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021193; x=1795625993;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbTYA3WWftMVrKmwOoy/6f/vZwikSAfbNlm4H6PwnQU=;
        b=Mdobyx3QKeKGOc+K2mwPKE7xEnNTSnFEHfjaYlhxVR78hPxTUvMSjb8o8gJcROFKf6
         oiKkVfZbZVbKwMsePKvvp7zYYhRygWODDcUbrWJZWNLJ2/gKkORbcyVuyw8EEPY35q6/
         /+JCY3uuf16ExOq6955V1mfcZCqa58hVqcCPQdCSAhaYXVqHITW1Or4njEvGZBR2Z+y6
         FXNSFT3sSfoSzAFVlN77+bv0xmyKAyCDzfo+QZ3BBu2eyap5Y0mwgCdi92ptr/HYe5RS
         88puGf10uP3VtUblzjSEtfpb3hyRX2xJCpNmJfGoxvg0qE+I+sisC6qOjFBgxwJyyCtL
         2gBw==
X-Forwarded-Encrypted: i=1; AL+hErFmQd2x7dDmOYw5qbvfIcKkOyZlhzcsmPq+IL6eEld0G37Vg2X2FQET5Sui0MsMoK2YFUl6PL/euKQ+/x4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rI97JJveX1LNrsvfu1CtyTnnKOtU251dlWi8QPcDkxgy+ms7H
	7C68IQIdJl//or66PEb3vBiDVFWTrdFEXWqBLVpB6FSr3bykdDTMEZES
X-Gm-Gg: AZFdTZc+ETQAOumVps2nn7A7jQF/nAMdnY70+Esr12wONQuFDwARJvrDWcUTrwp6Nel
	YJycAYtpjjOQnKymb5Y0Shyrufj/SDQShbSNj5AghX1sr4aiDiYfCkp5tTP3WPpq0IR6H5AKFhl
	rkc9gsIQJ3ZxL80QHAl0+4BO/E1HYakegZkC0GGCPEVVuqo+6cKezNIxPsOECVDtsMmjJDK/29k
	tqPG7nPSSIXR05GB6HdIHbgSU4VkpPHOZoshQBzqrj8VChTVDKrERYkh35Zt5cgp/73+nGooPNB
	W4Z6QEe9iPus0lcdii0BOTBxiuAn3TDt03GTCbcQUvyEquuSpPczZfxt9j8Z2gggydi3E07ruBY
	O5ug1++unEPLXm2dy4Y/K3PH1hn5w2Jrjpg+FY45bQvFLFuuhmn+ctzzgVybQ8iGjR6zkPlIpPB
	OY5V3M65Sr/h8+qkU+Xba2qyWwPgODIARMACNFH/RBcPHtCxdWl+gbJt8MX+KqEHnO3p7vvP8TW
	7btRRKnhejvOB+IrYamXugcPN8JHeuVNeJkqzp1fQ15UAXMcf0/Gm3EEtpgceYylLy7N4hYwj9A
	YLyxVB/NT7HnhHW8qkkvpPT/R/H9ydLsFCYMtow=
X-Received: by 2002:a05:693c:26c7:b0:378:a35b:9e1c with SMTP id 5a478bee46e88-38281bfb0b6mr2545582eec.37.1795021192841;
        Wed, 18 Nov 2026 08:59:52 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:d3ff:1383:d316:8b42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm9180943eec.29.2026.11.18.08.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:59:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] fs: sync: fix overflow check in sync_file_range()
From: mdshahid03@gmail.com
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: mdshahid03@gmail.com, brauner@kernel.org, jack@suse.cz, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118062028.GS989762@ZenIV>
References: <20261118023452.48090-1-mdshahid03@gmail.com>
 <20261118062028.GS989762@ZenIV>
Date: Wed, 18 Nov 2026 22:29:34 +0530
Message-Id: <179502117452.61665.3127081747764752166.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi Al.

Thank you for review and feedback.
You are right that endbyte < offset checks become redundant for
non-negative operands when check_add_overflow() used.

However,I have also missed one aspect : It also rejects negative nbytes.

I will make that validation explicit by checking nbytes < 0 along with 
offset < 0, and remove redundant endbyte < 0 and endbyte < offset checks.

Thanks
Shahid.

On 2026-11-18 06:20 +0000, Al Viro wrote:
> On Wed, Nov 18, 2026 at 08:04:52AM +0530, mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > The addition of offset and nbytes can overflow before the result
> > is checked.
> > 
> > Use check_add_overflow() to detect the overflow safely during
> > addition.
> 
> "Safely" as in "doesn't rely upon the -fno-strict-overflow we
> have in CFLAGS"?
> 
> > @@ -233,11 +234,13 @@ int sync_file_range(struct file *file, loff_t offset, loff_t nbytes,
> >  	if (flags & ~VALID_FLAGS)
> >  		goto out;
> >  
> > -	endbyte = offset + nbytes;
> > +	if (offset < 0)
> > +		goto out;
> >  
> > -	if ((s64)offset < 0)
> > +	if (check_add_overflow(offset, nbytes, &endbyte))
> >  		goto out;
> > -	if ((s64)endbyte < 0)
> > +
> > +	if (endbyte < 0)
> >  		goto out;
> >  	if (endbyte < offset)
> >  		goto out;
> 
> Why do you keep the old overflow check after having added that thing?
> If sum of two non-negative long long values does *not* wrap around,
> it will never be below either of summands; that's what the last check
> had always been about.  I'm not saying that it's worse off with
> the use of check_add_overflow(), but mixing it with the old overflow
> check is very confusing...
> 
> 


