Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794975149;
	b=mH8FvltclUl+hzGuqoQJLtc0/C9/HCwYO7ySONLUrRletGpy/1XTAIcWmjgJdBFKqhBn
	 WMZidGVnDnuyKmd4qfKHoZ6A06ce8kbtZSrdtf7WfyMf1J/tbKgrtT3di5eXtBNJsulgN
	 WakH2wHnJ94CjQy+uxVD2wBeX+vsJVzmGuarSySsPuZph5nxeAYEuvm9oNHLteaff4mn4
	 16ucYFUNNs+o9AC90oRteiP+5CgzjsnmdW5pu9YprhEN4gfivDXsd6HwdtEFfF5gmeXWy
	 eOOCdEG1aasM6YTPQ+K2euBZE3HgQwfZ60qqGg0E7jXV5W0L+AYKqTLQfvxACFxCTZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o15E8VBznq3OnSKwZKdmsdReqhurd8fmzVNrgoC/tOo=;
	b=YWtFeAhpM2kGkp394EFHrrvz0dkyk7r2O+Co8rRYyt6geikVkp9HSas40fYorN2VYvV1
	 lUemDEuercM/vSPtnQfGFRV5Kyd3xCmhz2AmZjZk5Iaoaa8WZIxEwH3HuU26+S4sHUqT5
	 uzwvE+p5qJ/gSSDpN6tXKs6MsQYR49EmQ13+UFdzlw+IR2n3FkEupL3nGGbu9FMAGPJpg
	 9NHBK5pFcVgc89fbd0LrFN56QCb46bMr/hLc3ltlkQ4hjxu/SG/ML6DcTQTDTjdADqc+K
	 ub8L9eD75bcXWGWWV2+ZAkzJojWanCXOMEXK0yvwWdjXMogDbBCAc7cNCpRFfHqctgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GREU8QmV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D25E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GREU8QmV
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso3957a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:12:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794975147; cv=none;
        d=google.com; s=arc-20260327;
        b=cqosT1bGbQtV7aEjEnKI7iWg07Rt651Mv2YlRo3HixK+LlpbaVjQd3aZTJnXyAVas9
         Y5C5DtlYWY557J7hmFeZmxr/cogIR3aBGGqs/JMHN8DeaF4c3ob9U7xTAwbw0rg2IAX0
         J/CvdJ12H+d848H3skrGIS555p99ACydf+Dow4w07hSckONwRXBIUnQgrdi+EaYjsqIZ
         U1EHTp/aPJ5nMi7lPZjbYANh0G7qVYfOEhONYT0nxbgm/8J3FeuVC3zZyNbS30klbnKa
         w7mYa5vrp5lAQcO8KsntEpTR8Q0ue/hVmHEK8NAiq6Ot2ctQ1Lva6RbCHjKgWNuW3t+L
         9DAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o15E8VBznq3OnSKwZKdmsdReqhurd8fmzVNrgoC/tOo=;
        fh=CLMStqhxEkhFJT/aKjfhpkPX4l4phjSgXYU0hsPMmpg=;
        b=myO7eq/KMWi/dNRE00a0Zy3y/31YcuWAbe/4rsiybYoThc6DAhDDl0FtQ8Jk2al7ry
         4sHF1DG44DdiAqqGjABBZniLKuAruuvADuSCR5T3ZqHw4DlcvqoYinFtGLgE/NRtUVTR
         x4ibxnqQA2l3Hyy2dA3ihheJJNzUPglJv35RuUiFmzG8FsFira64tukxzXsYWI0N7I4S
         Mk2DQisqKZ54gQxLKKfh7aPI5TOuz3qKMUD2zfAoDUGLotG+0aQHp9EgzTz0255J9fMr
         V1env86OALCOT+AA1nOb8zjDR5onxjtlMVA/F2PAcSm5TUwnTvHmQOtHcnBi6z1Me0vC
         /W5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794975147; x=1795579947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o15E8VBznq3OnSKwZKdmsdReqhurd8fmzVNrgoC/tOo=;
        b=GREU8QmVAmeDCEVBFwNXN7MTiYaKSv5JM7liPvTgd1rHAK10tVhyIRjpvYMYqyRSzj
         BlAuNNqBEkl8oTezNEGjdvjnfYh8fIhkgxH68zkKFc4JfNmgjS5q9ZzMgN5WaS/PISAq
         KGMf6UqXuLGPVmawKclIVN2OpGHAZFXnx+6HxoVJut3Qvhdv6buoCtCt1BJ0gxlCtX/P
         l9I7USGir/HiPtIAjNUuxiIpxpI0K5G4r57LMkXB3zoVSluMTICjsnn/SlacPJVtdBnb
         IDaSzbKexvOrk7EfSAdbxz4jwzkRiPYxAWicnRHgxJhbbm49ZZ65k9BvDjQ3+hCqmzxh
         pVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975147; x=1795579947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o15E8VBznq3OnSKwZKdmsdReqhurd8fmzVNrgoC/tOo=;
        b=L1Qucx4r7cxkO/yL7fSbXq4WCAnhE7/hyV2q1k+9/oM7hEgiTbHm0a/R3P7H4KZ3f6
         nwRghiMrjEpHV10NCBvyBDI2gcILX7cNr9AVbFbfAVnsH7WwOb+Hj6+Pyj/P+rbuzuO/
         dBvIRnWsAPpRNNvIpI6TeXuh6wrFdfGGconutaWUcOFMWlTltzKzN+wG8HDVUnfbh9LV
         1433bnzisPJbCBS+M4QGWXiD1saw/xU3TytRXAkYkXUPiXEd3h7CSz/wLGiUmivMUY+A
         uInyhQ11BPheyjEx91rgMp38brJbAo+d630zQChqWh3QlVygKQJqCZV55KYGN/U3pwfx
         6G+w==
X-Forwarded-Encrypted: i=1; AL+hErE0egSZGdeYNCSqAA+ZJ89IK6DV6aBey39d77MYyR9ZvtQi+QvTeA6ExpWJkiF0ol0TTk0xPQMflx7nZuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sDpULXnYv/J+apiuZPbZa0i4m82tt9Gu5fejWEuQAIEz+XPZ4
	xV3Xhc8nx7opjAXdnpsighcf+iktNSWk0XJClIViRF10v4h7q6HJG1+GC3648/vJsEMu9wdwjjs
	MjMDYwJca+/LtatEwsoOhKQrs1QRgOAypfw1LrlkT
X-Gm-Gg: AYBFou1majFZ58qlM0yOFr8/4lyTbYTe61qQAo0kEKF81ia3OVFi6ddsdv+rWlLRwit
	26yGCmLuoCQmdPMwp6CLl1TgGa82QE+XDymufNvweiD5R2r7/z0W5T/hcxOA/vyZbatJA1bvl5S
	vwix+Mz3AOXzjsHK3UOZg27soMgpaaTw/LETBqC1RuRzWIGJMooTr36ulaSXGQ30766kACCU3eJ
	ZHBwoogFloH6pjwIjRYRIBk/qZQvRZs5Htq0WoL3bgPka0tHGhLFVvJFa1A0AUf4MAr8XnhVBf8
	j6jw3kfAqGU0uZKnq+nBfbBTHi/mF63iiv8HB7l+H8PyYr9hKNAIb1xvSTMaZvtJDunzvuo1fUs
	U13V+fbEnJQdyJdtWlh7ocWkt3vhzX+4LypHFnqcQNw1BtohPDoNMKRYSKXfFptsNxTWkqnPx1p
	JnrDJEQBBmcbOEbFlV3K5iIkrS9mtnQGzI/VVu8PRod59ioCNFbS3j2g==
X-Received: by 2002:aa7:c513:0:b0:6b8:7775:5154 with SMTP id
 4fb4d7f45d1cf-6b891f64c29mr42260a12.9.1794975146788; Tue, 17 Nov 2026
 20:12:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-2-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-2-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 17 Nov 2026 20:12:14 -0800
X-Gm-Features: AclHuK832QlDuaLhtggvyOdF46C2kT2L4KwGf1A_pjduHGRx-LZ-dnp3OGA1SHI
Message-ID: <CALMp9eRH4d0mKKTfE3H1Di2KNWgy++Yo4LoM+wZMydGAUijc-w@mail.gmail.com>
Subject: Re: [PATCH v9 01/20] KVM: x86: Extend VCPU registers for EGPRs
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:31=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> Extend the storage to include extended general-purpose registers (EGPRs:
> R16-R31) when CONFIG_KVM_APX=3Dy. This option is for VMX only.
>
> Although EGPR state is XSAVE-managed, and thus could be stored in the
> guest fpstate, VCPU storage provides a more convenient and efficient
> access path for KVM.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/abL8SW5JS1aV5goa@google.com
Reviewed-by: Jim Mattson <jmattson@google.com>
