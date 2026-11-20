Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181032;
	b=i4ZTtYTFq2WyWY736Nsmmif7tBx/GGUS7YM/ccYkvjUCCTbP4tbdbVKCqchnyrnqKtqp
	 Uzuk0+gsRJubq5QC97CYzFUBC30QRpLdREZXrme9Jxmbz0yufJ1R5+640h41OWVC9kUsD
	 dcOwA0OOFd0CUTN3VCZuwHIELeLMd483nNFEdy9SC+6sTCD//wBNs6KC8549vJJJnMcWE
	 0CfJwoQgICDnnlslrsBCjeuzQLfxbK1wNdOZFWSYVjX9Fz+Nuu4yyzK8uCbPFc9NnU5TK
	 ZywdxxwsOI1+yWZUngbRsvyeB7n34KL1EKac5QnVJk7tlkwTNlSmYrUW9c1vuFwFQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:X-Mailer:
	 References:In-Reply-To;
	bh=U9t5C73ir3/3QySglAwAwVOJ69q66296+82EjWEvxrc=;
	b=5qdVoyfrd/9sb/skT6zFBD7Xe5G1IeGODZlRSur62BSOf+hv7ssws4jFfGJue6kmHs4O
	 inNooeyqaV8BXo1gwNicQ3veJkZ45wH+FO5ULtsdtjgajOVSBSx+a92vSwEqP5FdA0CiP
	 bHd9c5vZTRijDn7fNnETrE5BcLl7xJOHnHrwMpB6C+CK6Q9rHvb3o4GslyRAkqaye+eQw
	 GlRAVARqb5qeuUx31Bh/UOJXlOrhIQIiY8Zq0S3wi60uqnjrxAJN3MOSoN/96RSzgghEa
	 xs/PIcq4bz1qO2FtoGABg8vcgYXCpcHfLF9TFUc6kgKE3wE3uqf6jaDZ61K3JTnJpjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUVe1kLT;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B43F60A261D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B43F60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUVe1kLT
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6348845e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181031; x=1795785831; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U9t5C73ir3/3QySglAwAwVOJ69q66296+82EjWEvxrc=;
        b=TUVe1kLTe1RrGjkZcB0Jll6qRkbhub5RAYrrBdXYAW7cCWc5ZfKjmtHsxejUWkMmqG
         JzPS+ZpHkP7wYDJTT9lXMucUyvaeiJXactdfcKWcDDB8coLAUlZ+SLxV/1HOPt72Y8vR
         ZlJc2GAvUJ9zeSXBUpYabS2EM7tBgAyo4jIeTRVyCxLex4cLnS2ZffMAZOHSFIBuAhgb
         IhJ9TGzBnVeS+qk3W+h/M+Afxb+UT1xmww35AkhR+sZmys0qIASFOsZUqQF5VUqAX1D4
         CPz+yTqfhss6B38ZRKGfmP0RMlFT5D9wepGDZqnoCfxFFAl5qcguvOeWnzTzLCK4pe1x
         4Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181031; x=1795785831;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U9t5C73ir3/3QySglAwAwVOJ69q66296+82EjWEvxrc=;
        b=QAP5QUVj98s3QwHQAYMLwfuEntsaf/yP3rkqkXdj16EnnTKfqwEogjb8PNAIKZgPRu
         ERQI8whfxqvG/s1gKA6FDAoQSTyWKUgb4taHBV0lXXiLN9UU+AzIeCPyzzYilfg6wFkU
         QXlBEHM8va9ecpihdYsFGaC2ntPi1OWFCBhnkSQFfFpHWlmPfVrcnoVdW//Uztlcokk/
         3RIqQioDJ0BmOiZE8S7Xyk/ofnl4nu0e3Q/fM87djEnLcXRnmWzb7XQp3EMnxTMDI1ZH
         vSAipUoUC/7yttrsOXtgpy38n+Ksn2EG4+H0pfvnek73cn+gbtV7/O16FIc2NzO1kIS1
         5Q+w==
X-Forwarded-Encrypted: i=1; AL+hErEtvBGugGPTjHoLWNqRH//V5mBe9JSZ0wy26O+HtwScMzXm5FcHRbw7wumdHtAvIT48BvV0PnMW5o9A+wM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bzqpy8vE/pPDFUWe8XbO/0q3KIoMb0l5JKBiB+FJpbJpFw3zT
	gKAkKh+i3ik5lDqgG75N8g7CUZPCMdzo0l4pZ3FP85DtQIIE2Xd0KAPS
X-Gm-Gg: AYBFou0B1CufJp3bj+rGkRSpUB+CSDr777XKusuUsax9cIQ6D9MNO1DS/bcf+tdzfXu
	xrTK/5HaJv1910XZPP6BhMfdsZnDcYNBdgUMQ4izqEb5rhacCdS1//HpdgoJc5DHC8poizHQC28
	55X4YEufLAXdI9vnsuWY9MG1fNtHINx2u6sWz6yOG2m8KQkL/U4AceKBofFNR1CH/5p/HxdMFcB
	600Ce7nL56Na94YCPIO4LG4EOIUeFuAxCU4j1JnAbnKLWdhYn/2Gi427WkiE6cDa5hqubbtsA9m
	N7adWZ0qqgkM67lzKSz53DjhhWsb1+DVzPwLTFsmEFSOMmiOs2KTSjIJLk+sqnXOlrSCx98uozY
	ZkiXj8EGq7u3S4b7wpbjCinbdLrWhTVd7kYPMhILLeJV1ltLwHx2w+80wLl7NE+qSCkt5JNuQgu
	Xn7cZVP4X848ZFGQPJDFe2MkQ3FFcO50SLnBGew08QCoYpbItjEJZK6tloSlMFb4F97FKuKhSLY
	TeBgCgy11SEqKjhfWjkkMv62FSwHPW8a8JU59E9fn11aXmiGQtixtV+zARupzwVL6lZ7JSxAnZl
	2QBaZ8r23isez1dPvE4ub75glb482iLA67CdN9T/SpLmIfah
X-Received: by 2002:a05:600c:3b83:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb88822242mr75040685e9.28.1795181030668;
        Fri, 20 Nov 2026 05:23:50 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm5518234f8f.7.2026.11.20.05.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:23:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7e8bd4a9c12ebb9d8a66b83f0766d89a19a194b2b3f96510da164a6c43d9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 14:23:41 +0100
Message-Id: <DN02K8EYWHSW.1FP154N0I9QCK@gmail.com>
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
Cc: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "David Sterba"
 <dsterba@suse.com>, "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Trond Myklebust"
 <trondmy@kernel.org>, "Anna Schumaker" <anna@kernel.org>, "Chuck Lever"
 <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Paulo Alcantara"
 <pc@manguebit.org>, "Chris Mason" <mason@kernel.org>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Jan Kara" <jack@suse.cz>, "NeilBrown"
 <neil@brown.name>, "Olga Kornievskaia" <okorniev@redhat.com>, "Dai Ngo"
 <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>, "Ronnie Sahlberg"
 <ronniesahlberg@gmail.com>, "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, "ChenXiaoSong" <chenxiaosong@chenxiaosong.com>,
 "Darrick J . Wong" <djwong@kernel.org>, "Sean Smith"
 <defendthedisabled@gmail.com>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 "Pedro Falcato" <pfalcato@suse.de>, <linux-btrfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <exfat@lists.linux.dev>, <ntfs3@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-10-koray.fra@gmail.com>
 <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
 <DMZIQG4U1NTH.2IN0S2YIWEYTG@gmail.com>
 <20261119220936.mssmaixcorn2gzli@pali> <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
 <CAOQ4uxhqgsh9ahJsX7C4YyZH2n_r8VwOe9X9jZwsKALCoYvyag@mail.gmail.com>
In-Reply-To: <CAOQ4uxhqgsh9ahJsX7C4YyZH2n_r8VwOe9X9jZwsKALCoYvyag@mail.gmail.com>

--7e8bd4a9c12ebb9d8a66b83f0766d89a19a194b2b3f96510da164a6c43d9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 20, 2026 at 7:03 AM CET, Amir Goldstein wrote:
> On Thu, Nov 19, 2026 at 11:25=E2=80=AFPM koraynilay <koray.fra@gmail.com>=
 wrote:
>>
>> On Thu Nov 19, 2026 at 11:09 PM CET, Pali Roh=C3=A1r wrote:
>> > On Thursday 19 November 2026 22:51:26 koraynilay wrote:
>> >> On Thu Nov 19, 2026 at 6:34 PM CET, Amir Goldstein wrote:
>> >> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail=
.com> wrote:
>> >> >>
>> >> >> Implement provenance time (ptime) in ksmbd, as introduced in a
>> >> >> previous commit ("vfs: add provenance time (ptime)").
>> >> >>
>> >> >> Map it to SMB's CreationTime, making it settable by SMB clients. W=
hen
>> >> >> reporting CreationTime to clients, prioritize ptime over da.create=
_time
>> >> >> memorized in the user.DOSATTRIB xattr.
>> >> >
>> >> > That doesn't sound like the right thing to do.
>> >> >
>> >> > If the server stored a CreationTime that client had set, you cannot
>> >> > override this.
>> >>
>> >> Ah, yes, but how would we handle older files which get a custom
>> >> CreationTime both before (in the xattr) and after (in ptime) a kernel
>> >> upgrade?
>> >
>> > Just to note that this problem is already there. ksmbd can export for
>> > example ntfs filesystem on removable disk. And this removable disk can
>> > be connected to Windows machine which will always only touch
>> > CreationTime and ignores xattr DOSATTRIB.
>> >
>> >> > When the client sets CreationTime, the server can decide if it can =
and wants
>> >> > (may be a policy decision) to store CreationTime in PTIME and not s=
tore
>> >> > it in user.DOSATTRIB.
>> >>
>> >> To fix the above problem we should probably keep storing it in both
>> >> ptime and the xattr though.
>> >
>> > IMHO for a long term solution it is better to not have duplicated
>> > information in xattr. Because duplicated information are going to be
>> > out-of-sync. Windows NTFS driver will not update xattr DOSATTRIB.
>>
>> Yeah, to avoid out-of-sync issues is why I made ksmbd prefer ptime over
>> the xattr's CreationTime.
>>
>> >
>> > For me it looks like that this needs some policy / configuration
>> > decision done by user. We do not know if the user will replug that dis=
k
>> > also to Windows NTFS driver (and then those xattr DOSATTRIB could caus=
e
>> > out-of-sync issues) or will only use it from Linux or Samba and then
>> > xattr DOSATTRIB is probably fine.
>>
>> I'm not sure if this is the best solution, it doesn't feel too right
>> to me, but maybe there isn't a better one.
>>
>
> If you ask me, this is not your problem and I agree with Pali that
> this is a policy decision.
>
> I would not include this patch at all in the series if I were you.
> Maybe as a demo user, but you could just as well include a demo
> user application.

Ah, ok, fair.

> The nfsd user is a simpler demo, so as long as the nfsd maintainers
> are on the same page wrt the mutable btime plan, you could include
> it in your series.
>
> The problem you raise with DOSATTRIB xattr is similar to the problems
> that Chuck raised for ptime vs. btime as the source of FATTR4_TIME_CREATE

Ah right, I can see the parallel, tho before the ptime change you
couldn't modify the creation time at all from linux with nfsd, so in
that case unless a user manually changed it after a kernel upgrade, it
wouldn't have this desync problem (apart from a kernel downgrade).

Thanks,
koraynilay

> Thanks,
> Amir.



--7e8bd4a9c12ebb9d8a66b83f0766d89a19a194b2b3f96510da164a6c43d9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawBJ3gAKCRA0bnTtJTDo
OJc/AQCn/pvK3+PSezucUXa1GtiKLjE7oMlXGStcJfzdnlWtcAD9GPZFH0ccIs4C
afAlaO9nsoqLSUJ3Hk7qioPrnGVqrQM=
=CBTM
-----END PGP SIGNATURE-----

--7e8bd4a9c12ebb9d8a66b83f0766d89a19a194b2b3f96510da164a6c43d9--
