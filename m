Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795823469;
	b=AyvOepmcKi7CJqjtukCXG00yraYLbrA5kTUZaksPTp0wpDXuXyE6P8Pde+i7QldycxKm
	 6Y5H9PPxj+2kb45wJp8ahNxFEVWbo158jxQDU0LWYp2OxpUrMfnLcaAyL525oZUajewzH
	 BLhV8GsCdkx1OLcNbOkgpOfSk/ARjA7S9T2WmWeHrNyFLeYqWvL3zpazzzOXVcBbULBgF
	 nc9kbW1zBS95sNnRE6us3wbxzfmXIlTQZiEO8clqxyhK1l0udklSeLhfkBuFc+AgjoFP4
	 zqzvNyl6cYTMBfWkc5U66CViQz4OAaO4PAQKC8gVNki+TtT73ZZo2nF4CNVNYQJHB3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795823469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
	b=p8riI/61AUvfwOFunjgsJrnkvVld84yIdAkDYz6vaERroLIrusdPuv18ZuDSHl4n3CWn
	 2Pg8DPm7XUZHRUs+gu/RPZnOfVjLIQ3pdYqf1fU4bPISE5gqffKLRk7R1QZ2Z4RaXV9cw
	 BYJ+oKjYD83Z9tyT5aT3yg7Tttgipar/biFL3VJKIYyyUISXkSI3dgEQBf/Mx6VNimMhh
	 3lzg0/tXt1+lZJSchh1qffb/N3sFIo3yZQ5G43pxf2xv72lBJLO5Vi/EyV9HzCHD35z+I
	 4KC4NM5dZzXPyxJqSQTDBOjObogqhp7X0BvFA/M55ufaTblKsE3O6Rt6R4qKCzbqQtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsRBJCk3;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF7606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BF7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsRBJCk3
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f03920c4a0so53265995ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795823468; x=1796428268; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
        b=XsRBJCk3h37CLoNuGVplS9B3qcgNJLLmLUTqVwgmIkFkQhQglYtGNLfv3eAz6mMA8s
         IktkZErgR3mttJlLafpvgr8BqNKTdB5oYd8fn+76KRDjakGh/n4qJVwh4/nQxuG5kV0J
         l9XD4U7jXCtd+NPd9XbC65XqToOMCS5dDqyM+QGwuQX+v1WqNsTor7gtOT+yx9xp7tJU
         esjjwnrovNs+/J5O8oS6rh7r3VFuCWgn1y/vPY9Ip3dpV4zBgjqQGs2egNPqhyouKdLH
         wTedX2UL0RmoB9g6lwn0gSQUH1LWWyQThd3Ji9lsOotG0h17iWKzimw9hmz9LQHkCigN
         7k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795823468; x=1796428268;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
        b=0nzU56dtAqgNZ084pvSzTQFkPELjxSOxwT/UjOq6pqhQzRMavkGgjWE64/vUl4/Vti
         QgXY2UiQsUo2yaRx5J59/xmFRtfOdC94kVmcVvvmSO30QzqsoqvF3tSKhxgUjzNcZKDp
         OJdfcU92tcl9qIJwonNKCwlAcrnSTM13NtgEfptJOeCn8fI3nOmLdPhHTGb/VJY6R+kT
         o0lg/ziB9/Ue0RAYlsTcQi4btSuPTOJMR5OpJeQ+cEF5Z+/28mamsia+nbumIIGLuKxS
         rMKFTNmVDFvFzhLY/ILBfFU6bsRW5WlBWMo01fn6/AVflaC5KvGtq7JZMZIgNtu5StFk
         S5/w==
X-Gm-Message-State: APuU4Z/tiCWBRDVETmG+jrFXvBDTwSwv5A2HBS1nZvQ5PFVVJIcwX6H2
	Q7KjKr+nGSTzlvIV5vzrIzqziaD2k6cucMVAaFJIYpt6C3WCWAT7buFX
X-Gm-Gg: AZFdTZdF7/TuxQcVAzL98fRER9zcOH0YvJW5rbgLWh8nrx7JaxfrqIq/KMUbdz1nAVO
	Undcv9K/bRX9C2R0YkobFX8EoiBjrCtM9L+nxnBC3EE1sAIqAvoMR/e1l2qBec8ziMiKrMpNDMD
	0+Bca6zpI/2ijzoVZQWx5mCPAGR0dTk1Wj3ZUOxfrH3EXiv/qJUkREsj8CCWJJ0OEmiDN/GR5u3
	F4vI7/Tv7LkEIp7jBr9nb636nf840K1r7ACA7uD5LDQlQss5TbhZqgDIpiHovLq0H0aPU7CCV5o
	8KVhqmFW6+oXKYjW5adS/npTYE3/YEzNuWGYrHK7Xg3rybqkDCY5IfJb3A2PHu3OXhFOehIHsKQ
	S3j+PG/CrwqOsSyfrSechY5n1RYUwrZg52gtl6Jiq/e83QnBH2FTPpGHpKABq4v0GGdyGmbfP+M
	2PaFmhlDBGhzvl0sLnn9XdD0PzyvuZiBdRVITMRHo9tukW8POuTqPwXJqudOIzi2SMsyXJlJx3x
	Lni6oyeBj+65LVZwfqEKsbFLTVQ+DhVMe2P6i713MDCrg4OuSJGyaKoJNRonYTc6cMc+Z1sbGty
	Muq1CC/IVUxGjHv/WJMVwW+FVP4x44B59Dv+NOMohXMlZngtSuuMR0QgfJuGBz4f2f3+nZTHHkd
	AZBM+lwm1tFlyibuG8MvftSaCpISysjylsQ==
X-Received: by 2002:a17:903:230d:b0:2ed:29a5:7828 with SMTP id d9443c01a7336-2f03f1770c7mr274805035ad.11.1795823467843;
        Fri, 27 Nov 2026 15:51:07 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm128158155ad.63.2026.11.27.15.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 15:51:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 23:51:07 +0000
Message-Id: <DN6EAFMXZAIA.F3ZIJ8N3OJ3N@gmail.com>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <awmn-8pxvHphS_xZ@sirena.org.uk>
In-Reply-To: <awmn-8pxvHphS_xZ@sirena.org.uk>

On Fri Nov 27, 2026 at 3:55 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/verifier.c
>
> between commit:
>
>   02d3452bdd80c ("bpf: Set the run context for async callbacks")
>
> from the bpf tree and commit:
>
>   d83c595d9480e ("bpf: Put a barrier where no mask fits")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks correct. Sorry for the trouble.
We're seeing more and more conflicts between bpf and bpf-next,
since the verifier in bpf-next is completely different.
We'll try to sync bpf/bpf-next trees faster,
so you don't have to deal with this non-trivial conflicts.

