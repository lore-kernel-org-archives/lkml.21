Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207379;
	b=Hu9QPYwpOnr3fYE0UGs6iln721ylUS/D/nxEo27ZmZM8bcb0X34ZJTyPg4d/2QuZloLD
	 JodMnNicTSLZn4+1bPcXw3d4v0MCCDh9GDjM7R26SauPHRrwamDmVd60gCudMAPzmmJaY
	 izbRAMiQKK4efUC65j0WI5doLMpsZxC4Kg3NGIYclJiUYOdRkfV/WvHZJU99XGDIBRqu9
	 1yg7nWQMYtMKU2KhvmXXYIHKy9b0c7Fm5GqIKNl3ouyWvmpHHR9bCWOqhYZkSWpsa4v1v
	 44ai8YDFI6VUZHLyV/j9XWFFFjdnnWqEssuC5PMy1eCnpoEZF8oVyhZyZSueKR7wQsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=zmRf5gxjlnJH9lvYWVVBAgX4Un3YFttD1kKPZfXFXn0=;
	b=D1HUoFxu2DiYOagFGl/GQ5uW4H141XaVAtgIQNmkwbTqxljxDHOWnWT9w0apV81QhAxY
	 23gQbvuaBe1/WyY7XGOPQ4KiC0+xY0UGwwrq/GeCy3vumIf3ZBj2k3PAfPYtkvkUXgRth
	 EnaYHZEuRuBVLkq9YD4ihHKYn+YVm5CNZaGZvRRNSeRdjtuuIKL/XlaBJj6jbhvULsmFS
	 RKmQnPpbwrJn/AHuV4ufZcGH3jx5tzDEmRDQkJEJQCpZx1YGWuvXbThQrmfZk1B0SnDsf
	 Meenfx5TMcumtRni44b+kN6FLJFWwLqRnd5cKzb6q4fkkEv8DFVrsAiMxAH7rA/RsIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548B6070A57
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6548B6070A57
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9496317b730so161175585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207378; x=1795812178;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmRf5gxjlnJH9lvYWVVBAgX4Un3YFttD1kKPZfXFXn0=;
        b=2RvQgjmva5x4u7sDMZRxchwsbrFVmP5WUoJ9niOB4cMvXvDEWPwaMVPQSJaNgEuziR
         RIgcJsju4I0WF3RQab9GevnrVp++27rTMRTdaN+p27xHvDNPAi30g5iQB2Uth/6XTYva
         fg0GbSKcMJ5Qxu96n2IaFubnBJrALqGbZk7zvwQhEJqDv0WHHi287eXGWC5gp20y6539
         tVAi4nrxSkgUTnuDjmv2aDdJ6LiaCcWG0gW0ldMhIkBshXCeMjNs3VbF4t3wdmLiUQKQ
         zv12iGz0PbISa1TLmwy+MISw/7SOLS4NfewLm9T9p7gr1325L6Y0+L8od/ez0JMlXD57
         XOZw==
X-Forwarded-Encrypted: i=1; AL+hErFPX1RLUFj5sAh3PW2tNSSOUV/RJkUoGiPSOCHUk91Wwy8gOavCmGzP6au0nTM5Rz5T/4NJBSjh1yvPi10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sqwwq6YU/QYn32KajwkbtYu9Dga+HinRZjGsKVAmruCp7EMNv
	fXCDh8roxhrjOB9/f5bEok//wvqzGU4YfePz58f+ynr1itaJFbZEBt6F
X-Gm-Gg: AYBFou0rgry8RSjz1zNf+5QybMKcSMqruXlZY+bYwXm106EQp+Scmd7sQdQj2IGgSxm
	w8pJs7m1h1H7sUYn/PzSg7oCAQvNCgtIevfUHS6uzgiPH1qVMZlxKsJIuIb+tlUOEVh1E1io3vs
	sHQykj/+YNH0NsmbngIlZKxAf7ldunQfnHGlYFHBdhSLLFa3YxuBsU90I3oxyggQOtz+PLUYUmS
	sgYGsuiLWfZlfuTmYBumH1J9zm6KjaICRbhSFfleTw0q46umS8RmChqadu6T74TM7v/Pk8Y63wd
	kcPsJ6Atac5DxIzcf6rO5r3ozFr+ui+OpqCtk+K+RakHykS2jUv+x5jwEwWrT3t0FeC8+E3OxeX
	CT4I0Jr+y21hwODn9l6xUW/GJnOMkDLAzNBS41lhBK64FeHTEQwTN1joNlY/2piQ45uVa3FhwQ3
	trOHEwMW9nfkiQ7tu/qXACJpsAt5E8QVa7sng9QO9/1xBDphQdNV31tHjEJllrEqjDakhiNJSqg
	fwSDiMHj6np5+rscnCBZBv0wSbDb9s5zZumpkdHYULqgBqF4Pvnq1q4gD3p4ohMc8MsL87EbE6l
	388YJ4E/aUUWwISr5OIUETS6pe5djy6Q/14/Kli3yp2EXdqv/Tb0imDabBn44z6ARdU2rZj+zgX
	jspSiPaguB8Fz/sI17XKqYPhrkfb+N07yoXN8eF747LzXNQ5y7/1d
X-Received: by 2002:a05:620a:8801:b0:947:8230:5328 with SMTP id af79cd13be357-949ba9cbc05mr698548585a.34.1795207378346;
        Fri, 20 Nov 2026 12:42:58 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40ea12sm278707885a.35.2026.11.20.12.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:57 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf v2 6/8] bpf: user_ringbuf: Handle position wrap
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711468.18576.11537240668767230400@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAEf4BzattX9GherSPJ7DBeKksfxsX_uKz4y4tYNU=gUjqkJP_A@mail.gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-6-33fde039ddf3@kernel.org> <CAEf4BzattX9GherSPJ7DBeKksfxsX_uKz4y4tYNU=gUjqkJP_A@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> should we use long and then replace cons_pos >= prod_pos checks
> with `cons_pos - prod_pos >= 0`

I kept an unsigned native-width distance for the empty, ring-size, and
record-window checks. Would you prefer a signed comparison alongside
the window validation?
