Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.240
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795410457;
	b=In+SeMdg0NtxdbQt6j44KtQdV+/TVr2HnsiVzPH42HYm6315y4N3FVwmUC3yaPKlsLjg
	 cBnpaFZGBhyMUXaEfdfurK1ai0U3OcaU81uGo1YtQ8wicicPQ8ny1pCEufCWIzNixC6VL
	 fa+sJMoVM/y/Mam3/VeRfN5DEcgxdXAYQs2hYqJmYXx2DvkW9ph2e+arAsDL7DudjNRO2
	 OgDTz1WKDo/k0Tis6RtsipNiDOY1zwbZ76rgTUqBsejD8vZlGsfBtF+Tt+SisLRxyKc/F
	 W5fgS5FYk1fXTxPh4Z/Ph/A4VExzqqUJ7IVsZTWgaUJJD1o79/UmAZ33QfodUBCDn0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Orig-IP:
	 X-Proofpoint-Spam-Details;
	bh=/81pZypqQSSDxn9bb2q+RIkTbulWDFUKFacUC3zJgzU=;
	b=VK3lTjbyyzNPRYSuaCis/mEISSZo/aBLlblcTFSUwNvP70ebFO5vPf+ELtSklLJtmV0o
	 hUSAQLC47uFNbXm+EQvQhJkOs1umPwMEEvbeS4W06KcsbnA+CGEl/w0X695hjvHKbnvsc
	 J7D1HQ5nLhAR7SolLJoqQ8bq2jznSMwfF3QuhhJLgikYHUatrYX1URivR1Zf+TMZdYZoA
	 3ea84L5gWcJIKD2IIdfFzULrbTGY25FyJyVoCKUynyWR5wZcHTs+dyPBeA+IFeE/ClBIU
	 I2uPoo6uNxFJX1mdxlBXPpbcvGZSDRPpDfX6JP5+tQ3rv2u1PGVbXj7kxEQqmYQvUPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=SKecWwbz;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b="TIgd6/up";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.240
Received: from mx0a-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A485606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A485606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=SKecWwbz;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=TIgd6/up
Received: from pps.filterd (m0380321.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMN4T9i3346681
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:07:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180315; bh=/
	81pZypqQSSDxn9bb2q+RIkTbulWDFUKFacUC3zJgzU=; b=SKecWwbzU2u9GAUzJ
	mrZL/kgVq6L2kvuwaF/YIfl+qgqmmDSt2sOblwR7tFCY6lTY3GflTsPF4J82l9S8
	/p2yQpxxeQeNG5+8UBqhhJtFdZON/7pPmq1hREBksdQPPU1XE16EcfELFmQVK4/k
	jUfHdceuuZXG/jzPGDDu3UeSJC/fMMqly7KA+mq4UdFy15bpBYRSTNt+4bgoGFDQ
	zOhDZCJBP7L9wwHWqG/Bqb8J046E5o7q8j0TlQB5JThmdcPeXBoFw6EUZXUtzBv7
	mR7gwOyl30KUO1K28KRK7E27EaHm4u0PngI/D1Rxc3zkaqVmP7m32oah8JmgFzbs
	RZxvg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4j49rejgvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:07:30 -0500 (EST)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386ad819860so1880948eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:07:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795410450; cv=none;
        d=google.com; s=arc-20260327;
        b=HJxXyLkGsYhmoTUNJpaT+pJVsLDKT1Z34VRBsA9ai3ltNxN6xjo7Z9FgzGw1KRZWaL
         KZx4MwPLDcpPOMN6fWEz6dACQSKU7ye4dK2tpgXoa2lHRvn89Xdpn7jFylsHwvjjHo4O
         Xt2bIyfjuYQFEl1owoEWKuO8s7mtEtv42xisyA7VcG1lHa94Js/EzAUKITt3a6VwQaxm
         59eYyl0kUwPTYj+YRfXTuida6SrADZobqyip7ZeSCWYRuvZSg8POG6mtPZNgYvaROfPL
         zWLcztC8ntNg/0BO+CnIa1Js/g2gV1T/NtVtU64LkBEkwx/LLMSAtAf1+js+0mdWOrtZ
         Ygtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/81pZypqQSSDxn9bb2q+RIkTbulWDFUKFacUC3zJgzU=;
        fh=ic/xzy5eDlwWwpP/tSHIlpzofzywRmZ2MWnf0sR5xHA=;
        b=U2Kqg8sxUJh5bkDPYVL4qMrKxZxaAgfzHW3u7/TfmYnUoQFi3+4y6QthmpmRMlP6gj
         h5S/bsSVWau71rsnD/ogBoulY0WUQvB2GCb/c+4904Znfg8ZHnsknDlK486B/TDTE6Vt
         OZobrrC5K2d0IyBFWavEFE7LYgMfjdnDFM7XHMghUHsvb5toH8soTnN2PSWB+6ND7cEl
         aTHf6RZjsbUNbEV0iZm0vVRoju1glb8JKbNRKAbpfpzzs3r1NOCfvk9nljg/Aw/k7MbH
         BaxAJZOnReLuyDwrusWCRtkVkHuxKMQmKx1h0S4+2qczDTzHX8GDipljl9PaqcbjgMdQ
         nbrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1795410450; x=1796015250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/81pZypqQSSDxn9bb2q+RIkTbulWDFUKFacUC3zJgzU=;
        b=TIgd6/upojcd+8Jbs3co77C1DXLyM9NH70WqK28a5AKZgCrU2NWncN7DzWWZpX5Chz
         RuWujONljx2vfAGAC1r4PwAQl3wL5QfE7kFp/G3I7pR9taRpxccT4dVAsV0O7oSCoksY
         t5iPiGOXcXXnqi5fveQ0t6Fnmb6pO72XO9XTSJ/HMw9ZsWFwNZIQbPThaNfYof/ztHN4
         pIqvC7UJBALraUFsClziKXuqLk3jZaIA5bXokv/P6mXzanlDSuouWUic2662bx3fd97V
         evwRlDYBGuWJ1I1HN6ljPTQQ7M91JlASih6suZAZc+SWmBA/08/71mcmKPb4mdStchce
         Qpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410450; x=1796015250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/81pZypqQSSDxn9bb2q+RIkTbulWDFUKFacUC3zJgzU=;
        b=pM+EXBecpbPotx8QIzdku0kZh6NxFC7Jxcx/dX5cL8dRmmvou2jsFnaH+KjpyHfaHw
         1usmgA7bXvvnlAbzm80J1R26rOKYNNY+4Wb1hWoq+bGvC9GgpdCD8PgoLUsZU9/Sztnk
         vG3qjt7nrz7RphU7JVDl5b9ORB7rMcUaRuwErk3A69aUMCWElD+kZ1iqHSHkn5/hVJUI
         EkQuhl831RgNLlJsQaBXNhi8XkYi56Yl9m+chLImNGUTEej/ComUN3EpjKEBBc+GiNWo
         PEITv7RAQHTShfmNY2Z4iAcH/Ut428XIAOciZt3lK2563E03DJ8irHX/8VnYMalwqmRW
         u+2A==
X-Forwarded-Encrypted: i=1; AL+hErE63+9DvwMYhp1NmweefjkwFyOOMT1UbPl7ccWhLI+i9qR13SN8tDWuRzs41/ehVn0EBit0DpMFjocQ054=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eKgxMuDnCUDxu51K+TXLXCORly+np5NL/v4XlnjHJ96XdqT/g
	dklQuHWpSRcn+eQHYo1nYwrn1OnfcZlmSPENdx31qqua0G/uJ6nXyJ9Ulp5Lo/qO00oggYQKNZk
	vXJMl+lmdLreMAoOiy2nLTo0i7MDwzRS1hNkiLcorAfalJ5VZufCascQeKzUkLAlS7u4wi3F0cs
	ECmkQpqia9delvQDaoHr1yas34cjb+q3b+6PNpHw==
X-Gm-Gg: AZFdTZcm1vey9434QqBx3BKg711HIS+hUulbXtA37/OEN442dyofi29XgzPJU1TVRqv
	Ec5rTDFuElacAsgIuoQn8yNm7LTyINFbzefR0w7fD3CcDIwPQxyedbnAGTZvMEk4pwn8BM2dbho
	/Jbsi0L69tfYA4MHQS8Y1EQTMCwV4DyKGalHeX/6Eo0c53qelvHsbB7W5qiA==
X-Received: by 2002:a05:7301:df48:b0:386:a5d0:15d9 with SMTP id 5a478bee46e88-386a5d018c8mr4769339eec.37.1795410449621;
        Sun, 22 Nov 2026 21:07:29 -0800 (PST)
X-Received: by 2002:a05:7301:df48:b0:386:a5d0:15d9 with SMTP id
 5a478bee46e88-386a5d018c8mr4769315eec.37.1795410449104; Sun, 22 Nov 2026
 21:07:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113030257.1061200-2-kj2864@nyu.edu> <20261122181622.1294305-1-amarkuze@redhat.com>
In-Reply-To: <20261122181622.1294305-1-amarkuze@redhat.com>
From: Jerry Jiang <kj2864@nyu.edu>
Date: Mon, 23 Nov 2026 00:07:18 -0500
X-Gm-Features: Aa3M54rDQBOKRDXbJgbB5JJzrGqttkv3os_tIAGF8WXn09halqO4jreeG9nkw0Q
Message-ID: <CAPqbLS1vgOhyXT8zLiDmf_1W3zVq3cgAcvu0AbmKCSUCstpqaA@mail.gmail.com>
Subject: Re: [PATCH v2] ceph: Use unsigned types for snapshot split counts
To: Alex Markuze <amarkuze@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>,
        Xiubo Li <xiubli@kernel.org>, ceph-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, co+408fcc361565713f@bugs.sh,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Cpcq4X4D c=1 sm=1 tr=0 ts=6b03ca12 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Se5WoFf3ZZRiLcel0nel:22 a=Vu6uP2Wp0I46Sktgawq-:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=ItuYklrUK8AZe7o1UmoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: dk9jx4DE352dXXKNQuYnLUf1xQLv1nL-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxOSBTYWx0ZWRfX6k47h2Mdnh9F
 ZfN7ZkccO92M2If3SYbF673MtfzbuQnLr32LbjBfR+7Zidc+kwiyf8MXjvFQTvyQc5Zp+deN8zc
 aA8kNjU/5AiZCAhSUHg4jnCzcq7Z+S4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxOSBTYWx0ZWRfXweapOt/cWS/N
 Gn7fZHnHe6dB546tDUpI6SnMUPqhbZMNQogQi4XFLrztu4A3xa+IZKpw20kGSJLMDQWoNvPkhQc
 5UFheKC3DQmhVzKkCSrE/HISzVNPkPetmwQU/TIiv5Kd5VWFKaiaG6aR1VGmpmM97PKAOI31ahv
 wnr6tSEPxpvBDBw/21sHL/v+rbnv9IO5H49wAvFHUFb9tALfxmY87ZszVGr2FmjkUhsVF9UrcpF
 WAesCCH3XjoSzYj/vKgafNivxhSW3DgfdaG0YreHjfOU3M9ILjQ9wXJHGavlHkAPH7WFfkmqJO4
 9izbLSnryTNgifm8/kUkF4yPW2igCpSXAbzPTAZFg4QUalUkPPP1ph32I8Mmc9806V3L0BTPeCA
 is9w67drrrZ4IJSkErICAmFYUoiZ4Cw034ivrBxz+exlMNm/Fq+X1lT6gx+hMAx6fXxdjOHorZV
 0mT/9s0+yPd+/CAz7Sg==
X-Proofpoint-GUID: dk9jx4DE352dXXKNQuYnLUf1xQLv1nL-
X-Orig-IP: 74.125.82.199
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230019

Hi Alex,

I've made the changes you've requested, please let me know if any
issues occur in my patch or anything further to fix.

v3 has been proposed:
https://lore.kernel.org/all/20261123050440.223436-2-kj2864@nyu.edu/



On Sun, Nov 22, 2026 at 1:16=E2=80=AFPM Alex Markuze <amarkuze@redhat.com> =
wrote:
>
> Hi Kaho,
>
> The new array-length checks return through ceph_handle_snap()'s bad
> label, which drops the message without fencing I/O. If the MDS sends a
> malformed snapshot update, the client can miss it and continue writing
> with an out-of-date snapshot context, risking snapshot contents.
>
> Please fence I/O on these failures and use the same blocklisting and
> session-close handling as for a corrupt snap trace.
>
> Thanks,
> Alex
>
