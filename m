Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795687274;
	b=wdWyjgFAAvoqEoJpNgTUyZrJunmZ6CvvsOy9xq56mKUNZut3jAnhcLS+OBsenN6+kEnS
	 h5YW/PogNeLEdYEoLG7xjNoEk0G4FBtUWiROTQruN39xj+0fQ8yCueXkFwC2758liugRg
	 KmjQyzPA9ZLkIQ0Rc+s5ZwNyKicF0HlsefCcosJdmZkHbm5JyuZp+rMYE+lQJuGUrthI1
	 NKF0Xp6C0aKiCP60fzikWhkCDtLsCLCuxSmbD6AehLKKRNh2LYQG1Abz+bZu5XdY/oKOh
	 +afPPLsA+wIHYuKcyKkfiiMMv3TLlhzLCJGOAha7zgD8Na0TA4WPpbSKQTb8A6zc0xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aYKQnwDhjsX2Rwo5e8r5ugdHrz3FWRHjbaFWjzM+zR0=;
	b=OT0N3OPU/UV0fzAGZl9BOm0cberAERVySk8MbqdVd1XVIFXm7/afpjqor7TOpVWWiSnI
	 tPeUejjUISJ5+KtVpCFXXiz0yISF8QBAxY3n2hXCP1A29msX4CP8c7Stgzc8DDFbhv1gb
	 3DEuZTrXxdpZRtEqEU14ZYNSDvU9HvHoBwPGAeUZy8JFM1NbCLApCpz75H6fnHw9Twcej
	 rcYfIQuIotGaxhsGYUM8HzFbG6EwdmVnf7k6S/twGzTqMjx9E7YNgiwP8YDcgrK5yCFOd
	 nXHXSU2nz84B/j04WlVWdAiTd/cDZHcFbQ0yg7eE1iM+EQmWKsKY86wAA9Xs+FpGOZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vn91J1k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EE3606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EE3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vn91J1k
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5198302d38so427219066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795687272; cv=none;
        d=google.com; s=arc-20260327;
        b=BG8UFG5008PQNwbHiBb6fjYiUmd5m6uiXD3MgFIghurvYkGM9p2HWvrQtLznQRg5pW
         h/NoMG38lCTUvLPWIhEnAq0AOdtL6TE4/oO6c00otZE+iGeNwyMDP14evMZWjOfeU0t6
         fQqCx9Gt9IGMDLQgzTpZ9gS1Bw0CNX5IGlqevfFKOiPdFRR3dFXOV3XeeDFdI97JNFBL
         Dq5bLGM5daZO0d6tn+f3JwMLJTZ+guP/Gexjkrgj9A6QbAYCcIp+KfFOmbWKKn7DeYCB
         8OIJhMOnXyoZ+QBCQKrQ7a6tEVmsDCFwjpandpZUXIfyOsqcdtDe8VRqdfsjoBaViw+2
         gUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aYKQnwDhjsX2Rwo5e8r5ugdHrz3FWRHjbaFWjzM+zR0=;
        fh=pNNMD4dSakm7aENM6K7P0D0wkZS8QonGVPg4G3bHNT8=;
        b=CkrQKAm4QEabZ568fXfw2JUt9PBTZXLzwArEOq8L3NGe137u+JmhcQ/R/rqdHNLXWb
         IoyedpXD6Mscshuwv1v6+rTIk8+PhIUUchwx+gA7N+Q53AG9z8FxnG22PFSGVd9XbiYx
         15YwUjufxzLVsFJHnULhclFUWT7JwFRR/G6jMlsSs9bcf2j+7ppR3Z4VuNXxKbE0mobQ
         n4y95A+8PqEJvq28Hjwi/q99BKRODOlcQ7cAHnHlVobijSNTqaM3FpnewkY00ZlRguUm
         4XYs/XOAkhJpdYnD1qhwHsRG5bt3JIPXy+tKQA8WYV4CnG8QFihxpJ6wts04nbDf62DU
         lsbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687272; x=1796292072; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYKQnwDhjsX2Rwo5e8r5ugdHrz3FWRHjbaFWjzM+zR0=;
        b=0vn91J1koeRORHW59Gk9smm6Odeb3juyPnzCX13yTnGbmbtMMAS/mB/sr4r0s/fNCk
         dq2yREcMxLXmiGbE4wVhffGFOhdHJ3GFjKK8d7fcLmPGTGbElfsv560Zd754WUKtvxvm
         +tpX0U2zKuu2PrUfqgjIXYsZKXzL2EIz0yenbd/crw2w9N1u2aefHjMM5A9f0Mg/rbBR
         Eik2MkC+9was3vTS+Swz8gcLKh0x8a/4FeTPpSDZ/ntwHoxMN6vXgh7ZT2qNjHMDf+f9
         PTZBUj6tHsfgqgKnPLw2kRx7woDPnsf15vkwuc0YwpOmVcnMUA6THjw/3L01ohnsY+N6
         HwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687272; x=1796292072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aYKQnwDhjsX2Rwo5e8r5ugdHrz3FWRHjbaFWjzM+zR0=;
        b=cfTrR4P3HMjpfQV0mS1E/0RrT3E38zIQg1PqxL67B2xYwDgYJCP0DgucQAdl1nv/db
         hwPhJov8lYHwGoIG+a6dEbIb3NcCCWGfIMtSkKU2pZwuVVsOC3HYACQrdSUkjRnjHBQF
         zUxVAl+3aymuI0N5GqHYkcgsNH8blLM6B7O+fIVl6FbcQ7gli8AiH3JUx7tWU20y7g6n
         v6PQq3L7znOHNGmrQW4qeg+7SzB1wXd1YVoWlDCia59YeeaXBWTdeOLwUxK0bRYDY0Rw
         Tf86Z4sajXd9JeI/j0W5Vg/x/IgTmQfDY7HEeZy0PqNiSQ6glxvJRmFVJCO3qSD9d03L
         3e3w==
X-Forwarded-Encrypted: i=1; AL+hErEEsGTT2yNaiRMCIsihptpFDRxtSocRzCmp6KZafbp2T86xI7RQd/d6PisoA4uwmIZhMhJ+OKIr9yplf+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+588ecy0vBoU9hIJSBh3m4xjswPQhvxfBDhrdgl0fYUrdZl9zD
	iyhEsEy7J9IXIOXuQRCZmZSLNdqyC47NSrBMQIL8RHPafqsVZl7JQhef9GvOR0VErPWQ3EHCvBs
	Tux4kw+VfbMREe51nq06D0n+8RbFs2YI9HIz2vwQ=
X-Gm-Gg: AZFdTZcth2RzkrMeCJtbPGd4sEDR1UAVBIOT50QZ95h0yfxvoiWPIZG3l+0PeT2fqSY
	Y5P2TRk0l4jokBMcMktP/S6P6KU5goJm+jIQPm27GQGjXta8NQxpJo0jBDWHsyC7A/B7ZufHsUN
	cEDfgbGIsGzztTj10k5wC7B55qupAxetQx+fJzvrRuW4aJ1HrU1rWCgMh6DpWdGo2mLFJSPzU/c
	TKit5eE/gEuDSuxIA2cR3oKkSoYHMlR7Qra5US4LFsHjmUFwESonIOTkYfVzExOIi8ctUB7GFh4
	x2mbPsScbOMcI0kXalOJOmYx1Dkno4xAfBPKBc6YGgbpRHgQbqWxZIC/C8qaRDaqRoRgqjqdWix
	HFMFExWuuJdBgpxCA6t2I8U0nj7vSTFm277sSFQ5HfjBfaW7E9sJf0DpysS/Z3MJtx71mVKzpXA
	==
X-Received: by 2002:a17:906:4f89:b0:c50:55bf:ed06 with SMTP id
 a640c23a62f3a-c513aadb865mr1281974066b.47.1795687271598; Thu, 26 Nov 2026
 02:01:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125175203.1003294-1-e.velu@criteo.com> <20261126004429.GCaweA7XoIaa5k_ZBh@fat_crate.local>
In-Reply-To: <20261126004429.GCaweA7XoIaa5k_ZBh@fat_crate.local>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Thu, 26 Nov 2026 11:00:59 +0100
X-Gm-Features: Aa3M54oOytfYNQ739rl-1rU3U06CqvqDxSo68mZ7Dxr4SWbt1lKm1CAfVP2UqHY
Message-ID: <CAL2JzuyqD-2Ka-D4hhURtn892tDvHacz2C6V7a-wFMxQkEe_qg@mail.gmail.com>
Subject: Re: [PATCH] x86/microcode/AMD: Warn when a patch is skipped because
 of the Entrysign cutoff
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, Erwan Velu <e.velu@criteo.com>
Content-Type: text/plain; charset="UTF-8"

> > +     if (cur_rev <= cutoff &&
> > +         ucode_rev_to_cpuid(patch_rev).full == bsp_cpuid_1_eax)
> > +             pr_warn_once("Patch 0x%08x skipped: current revision 0x%08x is at or below the Entrysign cutoff 0x%08x, a BIOS update is required\n",
> > +                          patch_rev, cur_rev, cutoff);
> > +
>
> Except that a one-liner in dmesg doesn't tell you the whole story.
> Also, not everyone can get BIOS updates and then more questions arise.
> Perhaps I can document it in Documentation/arch/x86/microcode.rst.

Boris,
Thanks for the quick feedback.
We can adjust the wording, but it's important for the user to
understand that the non microcode loading was done intentionally
because of this trust issue, and the only way to avoid it is a BIOS
update.
In my case, two identical systems (kernel / ramfs / OS) : one loads
the 21c firmware and gets TSA enabled; the second one remains on 215,
no TSA, no error message.
User complained about the performance of the machine, so I initially
suspected late-loading behavior, then an incorrect microcode that led
to this code.
It's truly important, from a security and performance perspective, to
inform the user that the kernel made this decision not to load the
ucode and what the possible workarounds are.
I think it's important to inform the user that a BIOS update is
necessary to get a ucode greater than the cutoff, and that this has to
be exposed even if you don't have any available.
Erwan,
