Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795154626;
	b=GAiY8Ki6qR0D7cy1QK+hskh24IxLknFBi7dpTXc/j81B+5AWRrW27885dD4LLOCq0mvY
	 tT2fw0iFwba2NCCs6/hOILXuaUhIvsHEOOhEr+7GzPgEZpNnYqyN/pyuUn9o2yawGG9S5
	 aAgBpSWuBxXw/ECi2kSBgcWxDRHq95W5DElGO9rAIrEriWkqKyCAGauFGAeyXK2UnpP2X
	 sM0Q7wWQ7fYpgNy3UGJiqLa2nFLPcMmirGh4KfBlyZrBkbZMDNvx83S+NIzVDt2Ik/dOx
	 M24RApTy7LeNtwTcCdnuZfl+MWWmnpWpwIt9qWPgzWupLsehD8Djmf6+kLgzfcp8nEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
	b=uQJDeWcJWxQZCwY0apaeN+wfkJie6TKpKmzxs/krXSzmK6FobF1LA1d13APRpl3bzy2E
	 MOBwNFL4P4MUQu+ytvVHAHCdONqnm5W1THtmYNxtiQlZ0+dvZPT0S6UnqU+/gYZ7mN/7R
	 j7aCW5FeLTWR9KGUHkD4Haw8cZtB25T7IN4ufKI0S41wPsFHy4c9bSY7hQCcUC2Ih7fE1
	 m+BQUx6/hvhlIVXigZja6K5nkWteOpmMZbA0xgcGGNPKEXQ0l3Zbl0dWcSl5ww6oiufPb
	 EM0ROkG1FBFdW0pjOoII+2TDlyHWRP1iXYTEh+BA2JS8D8MzlKEzn1yWXs7+yVT4NrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twd3LSyP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9361E60A260E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9361E60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twd3LSyP
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso620604a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795154624; cv=none;
        d=google.com; s=arc-20260327;
        b=ZHtcYVf60I6fdAt2WezDZXZTLQ68muJkPsehwoNUJO8vLJpOohEadWsZRvf7q50ale
         wOu/511Zps0uqf6L6RJ1HoO8nM8I0I4VUoQmP3mfecdK4K+C+XdVXtweAMPts58uSolD
         u2l9jH/WiS0mn3DNO9illymHwdiaKTGHlrFHaW2mFICzDm133daDTlZOhMNayw48ONvu
         Bcc74gu33XlyQoM+yEpkSL7PLANN6lXYv1Q3s1p5ffSMjDeaszycAouv+jcCio+kfvE5
         Hfeoe4X8gp3o1fLCsOGdUHstymqS8OxIuMKqxVSzb4nPmX/I5XM+9lgqiHfeiEKIRQaO
         AF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        fh=BRL712CmND2EtGRblocqejbg7eLZOlOFIZSBaXMRMMc=;
        b=PhFqnG5qHA0jIUuCdHfEcVsxvCgemWFtSHVD271yAdZwXfhhtS9S08j5qIUe7jhThA
         GwzceHyOZqnRDpKejhLlgZoRlltTo29boZl1fsovLXw6G46ByL6e0rv4qx4yL8/0e+SX
         Ll7bM7SUdzGEluazH7ZmD2ogzfHhWbteUa6E7awYfmrGr7h5XMlrtNruMnEx+IIlp1BP
         h2fs7zoxHKieQv0GrRjeOBOuFQ2Uzd/TuH/bu6mRVwiYvjrKy1Vb12/kEb4lyeAvjwCT
         QickF+f+rJMGYZGeIy1+4o4JsJ9SUDT25f4VJj8zCEo1l/E+4IcLZA6DgPnmACdh0llr
         0MgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154624; x=1795759424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        b=twd3LSyPhh/xqGTUhGQCUkwTgPz0ozSKLDTUdzWfuC88iwf9vuQaz4Cbapmx3zwlEj
         zlPpp5xjkBRG0SDqC55ar8nBqU+85ZN/BbmT34kWJ4vxhbdyZbdyEQy2606KHlPpAcFA
         JFJXbHJDQWbyltdYp5JJ76dGIZsXzMVaFFB2lWR6MIffBbfdMhvs931PsHwOVCxf6WxW
         wy21QWjJiN1/vrK+nMRXh+VMOYDU0hoTkIxn3m45nhUC91hezeDKP97nETUPcHv6eNo8
         2LkA2JYHzh73ui1UQni7id0o3aSMFPuYuUQVmp+IzjGqkrZikwiCYxOEdafgsA18VMyB
         JQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154624; x=1795759424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        b=zmdGVbHiIt08u5hfWeJrHJtoXkSGa+8ZLDFW8NT3fNjVHTgzD2cEqTRA/o1O4BByCJ
         vPhgbCi/wGJ0DZZvZLGZ4P6isx03qacXtO5c8drMoI9NXP77i5BjydShJFd1Ijrjp/EA
         /0WKhRJ+5lcFfBuJWIrRn53fkR27epLUZZBBlaQpetvtWWS8qz5STti3yN1tl85Il9L+
         v2hIWlc8upDNIR3fbB35tyOieymQ5YWdEwCOaMVCZPQpxiI3GrDY8AnPJDvPPp7X3H8E
         rYsb85Mr5rJ/HLf2qnxZkPQ9Klu48PW6ic0Fl3jHmzQ1575UC6jqBPPSdOxyVXBa/mhx
         ZDfA==
X-Forwarded-Encrypted: i=1; AL+hErEPrO/dG/EVWV9ATnonMqkdGx6cjcntyOjRm4Pq5ugqWWm56vfzVfo5fd+eKKq76DBC3BCmxlFAxweKe9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NmYeco32kTgCliFJChZlCfQxj1njXeq8fC92Z6YFXYM2oEQvD
	BoC/BMPZ5v110xmWaObJpjCd+EgtrPePhZ1ohgZihJjiaSah6cE9CLFuZh9/Z6CbUfZPUNgcKmu
	Sb/ybH/R8o4KZdvA7TA3yLxciBKg6ohA=
X-Gm-Gg: AZFdTZepJj0aVrtC7lXcUFYQ/JxBAZoVgqKVe5u1obZeRPARcfk0cO2X2YZAxhdsISX
	OfocAm7AG7KFuqEyAcpycTnUnjox9bn0pTMoDmptbmVMvm+3cpbwbdJcoe4O79/Ak/FNMvxVR9v
	vGMixSOU7yntyvdApBTOA2YDDQV02JQUOdtMPAIxAVH5TogM3bMVna6lSgwgbhKgEOERFPi4arC
	A1+wh/1s2Q4aqpX1Mrkb++7vpjddtBFD50tdApOt3ICO2Qwj5Av2hqMVjUPye0H9jLHciyVAned
	+C9tPcwifJuv2eHxFCwgug25Bd5QEyRp7bEbXaUgTSHrwP1tzYEYYSwgzjSVh6ANuDsigGPJmvZ
	DkFZFoHg4uEfVYxTkqv/y161rjsQNKcbeyNiwodbjx0BFGT5hQNumX4HbCtLj1x52APE2WJbPiN
	aUwqT5EnLij+wlvCs=
X-Received: by 2002:a05:6402:e06:b0:6b5:4f5c:cb2 with SMTP id
 4fb4d7f45d1cf-6ba37ec320fmr1108851a12.34.1795154623771; Thu, 19 Nov 2026
 22:03:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-10-koray.fra@gmail.com>
 <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
 <DMZIQG4U1NTH.2IN0S2YIWEYTG@gmail.com> <20261119220936.mssmaixcorn2gzli@pali> <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
In-Reply-To: <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 07:03:31 +0100
X-Gm-Features: Aa3M54rvTAbJYlhFUqobPAqFrpuIqbxGTrlnaPynQQoE0nz09X_6dT10Gv8Q47Y
Message-ID: <CAOQ4uxhqgsh9ahJsX7C4YyZH2n_r8VwOe9X9jZwsKALCoYvyag@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
To: koraynilay <koray.fra@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:25=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
>
> On Thu Nov 19, 2026 at 11:09 PM CET, Pali Roh=C3=A1r wrote:
> > On Thursday 19 November 2026 22:51:26 koraynilay wrote:
> >> On Thu Nov 19, 2026 at 6:34 PM CET, Amir Goldstein wrote:
> >> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.=
com> wrote:
> >> >>
> >> >> Implement provenance time (ptime) in ksmbd, as introduced in a
> >> >> previous commit ("vfs: add provenance time (ptime)").
> >> >>
> >> >> Map it to SMB's CreationTime, making it settable by SMB clients. Wh=
en
> >> >> reporting CreationTime to clients, prioritize ptime over da.create_=
time
> >> >> memorized in the user.DOSATTRIB xattr.
> >> >
> >> > That doesn't sound like the right thing to do.
> >> >
> >> > If the server stored a CreationTime that client had set, you cannot
> >> > override this.
> >>
> >> Ah, yes, but how would we handle older files which get a custom
> >> CreationTime both before (in the xattr) and after (in ptime) a kernel
> >> upgrade?
> >
> > Just to note that this problem is already there. ksmbd can export for
> > example ntfs filesystem on removable disk. And this removable disk can
> > be connected to Windows machine which will always only touch
> > CreationTime and ignores xattr DOSATTRIB.
> >
> >> > When the client sets CreationTime, the server can decide if it can a=
nd wants
> >> > (may be a policy decision) to store CreationTime in PTIME and not st=
ore
> >> > it in user.DOSATTRIB.
> >>
> >> To fix the above problem we should probably keep storing it in both
> >> ptime and the xattr though.
> >
> > IMHO for a long term solution it is better to not have duplicated
> > information in xattr. Because duplicated information are going to be
> > out-of-sync. Windows NTFS driver will not update xattr DOSATTRIB.
>
> Yeah, to avoid out-of-sync issues is why I made ksmbd prefer ptime over
> the xattr's CreationTime.
>
> >
> > For me it looks like that this needs some policy / configuration
> > decision done by user. We do not know if the user will replug that disk
> > also to Windows NTFS driver (and then those xattr DOSATTRIB could cause
> > out-of-sync issues) or will only use it from Linux or Samba and then
> > xattr DOSATTRIB is probably fine.
>
> I'm not sure if this is the best solution, it doesn't feel too right
> to me, but maybe there isn't a better one.
>

If you ask me, this is not your problem and I agree with Pali that
this is a policy decision.

I would not include this patch at all in the series if I were you.
Maybe as a demo user, but you could just as well include a demo
user application.

The nfsd user is a simpler demo, so as long as the nfsd maintainers
are on the same page wrt the mutable btime plan, you could include
it in your series.

The problem you raise with DOSATTRIB xattr is similar to the problems
that Chuck raised for ptime vs. btime as the source of FATTR4_TIME_CREATE

Thanks,
Amir.
