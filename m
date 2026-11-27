Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790037;
	b=f3Ns3g4alBFYi/0VVfHfkwqW1tfYeUMKulujz5qfN8YNDU1EVvFVbFbstAhJW1NA0VKR
	 FyGTQc1Y1RcaiGw1/Ef17eD9qihXbRBD2IfgOXt3i2Xi+8EfOmnSEXIMSnZE5nwxnL75w
	 HGcWiJPZwevd3njGe/W7AUe6t8cTp31mNztKNFK1Z2f4p0sUvgrhy0Ct0BZGZ/jwEUHGa
	 mSI+p4ewk7YFSmqIL02urEVuBtYfsQNFUgf+zJbNR7F8lOvM1xLHtFy2n9bjlO2zeN3RT
	 ulsEk3WqT8z7Jme/hkwcbGxZgESIEskIpko5G2OFVYZlX+h9zcea7UA/uSJTkBCIdtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790037;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Received:MIME-Version:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Report:X-Spam-Score:
	 X-Spam-Bar:X-Rspamd-Score:X-Rspamd-Action:X-Rspamd-Bar;
	bh=dhYOjgbvmnUxoILC34Rgm8BGjoVnPNjAsMlA4W6UX/k=;
	b=qpNnx8CEULnpN6ekDJbIWoRNxOsMJN1O3a0EGoSUVggRzvvMGZJUFIrJ6a+0aCJH/2k3
	 1HM6OxeZwv4M7+sCzPVel5bwGY9fi+98v++TuCApeKhOjEq+hGvflRx0fi822Vl3d1SBW
	 h1TNmQTfqAw3Oj2j3vOKPcqeAMf6Wi5bw5tXYoLxpcj/idoPrMkXozk69AFWpo42LvUMF
	 OoZaEbr3NlLVerHB83bfnT/7mA02D2vOGol5NIokeM5QllOSN5yu92L+QAG9P/l1V/+xy
	 lShkWUuEO5pxd3CObmhr/tsukcvo6qNkryy1IXUThpabwLaJgMzUJHgbbd5YwhlpiJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=hbPnimUw;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49C9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C49C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=hbPnimUw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=dhYOjgbvmnUxoILC34Rgm8BGjoVnPNjAsMlA4W6UX/k=; t=1795790036; x=2111150036; 
	b=hbPnimUwZBI4Pb9CfwrXNzx7Gh1ji2HblOqm95TPUCMdNFneUTuDqAdae5wZFwDQMsz75pME4Tf
	4DwI9GJIT/UQm8d8MDNZUb1zFUumE7UYGgjr8l/erWM6svAhJVABK1rVSeT/ckZJdkECsseX8K28I
	GciMCHL/6RJyv1mnRhqeP9pI0FflMGbeF08hNMm2ejXUPxuO1tfGyQVT42o0fqQlTMzFfcdBJ08gE
	OMbu3XZDLN0BDvztytTU2edMW+oekMovea8xjLNYPoL1TJeFaQCEH4U+Kqsniq9yreGDbFTqu+AYK
	2eqFV+om8LqDN4LUPzG7QnGOhK2B3DCq8Y0g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xWx1N-00000004pSK-2zQ2;
	Fri, 27 Nov 2026 15:33:53 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1xWx1N-0000000HXbH-0KYA;
	Fri, 27 Nov 2026 15:33:53 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1xWx1M-00000003mvQ-3yXb;
	Fri, 27 Nov 2026 15:33:52 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 11:33:52 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yury Norov <ynorov@nvidia.com>, Valtteri Koskivuori <vkoskiv@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org, Eric Dumazet
 <edumazet@kernel.org>
Subject: Re: [PATCH] scripts/bloat-o-meter: describe output fields in help
 text
In-Reply-To: <20261126171845.de2fdb3c4b15b1b6a22fb7f0@linux-foundation.org>
References: <20261126-bloat-o-meter-help-v1-1-fb0785c94bbf@igalia.com>
 <20261126171845.de2fdb3c4b15b1b6a22fb7f0@linux-foundation.org>
Message-ID: <c12aa3cbb154dde7dfc1cfe8c1b9e019@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.9, Tests=ALL_TRUSTED=-3,BAYES_00=-1.9,KAM_DMARC_STATUS=0.007
X-Spam-Score: -48
X-Spam-Bar: ----
X-Rspamd-Score: 4.0
X-Rspamd-Action: no action
X-Rspamd-Bar: ++++

On 2026-11-26 22:18, Andrew Morton wrote:
> On Thu, 26 Nov 2026 19:13:00 -0300 Mauricio Faria de Oliveira <mfo@igalia.com> wrote:
[...]

Thanks for reviewing.

>>     Before:       size of all symbols in old file.
>>     After:        size of all symbols in new file.
> 
> LLM suggested a little adjustment here.  wdyt?
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: scripts/bloat-o-meter: clarify Before and After help text
> Date: Thu, 26 Nov 2026 17:15:17 -0800
> 
> bloat-o-meter selects symbol types according to its options and filters
> some names. Mauricio Faria de Oliveira's new help text describes Before
> and After as the sizes of all symbols in each file, which includes
> symbols that the script does not count. Say "selected symbols" instead.
> 
> --- a/scripts/bloat-o-meter~scripts-bloat-o-meter-describe-output-fields-in-help-text-fix
> +++ a/scripts/bloat-o-meter
> @@ -27,8 +27,8 @@ fields:
>                  '-' means symbol added/removed;
>                  '0' delta symbols not included.
>  
> -  Before:       size of all symbols in old file.
> -  After:        size of all symbols in new file.
> +  Before:       size of selected symbols in old file.
> +  After:        size of selected symbols in new file.
>    chg:          percent change.
>  
>    Symbols in both files with the same size are only counted in Before/After/chg.
> _

Good catch.

However, 'selected' may be confusing as there is no context about
selection in earlier text.

In Before/After, 'all symbols' is related to the note 'Symbols in both
files with the same size ...'.
So, we could instead simplify it inline:

  Before:       size of symbols in old file.
  After:        size of symbols in new file.
  chg:          percent change.
                '0' delta symbols (same size in both files) are
included.

Do you like this one? If so, please let me know if either a v2 or an
additional patch is preferred.

--- a/scripts/bloat-o-meter
+++ b/scripts/bloat-o-meter
@@ -25,13 +25,12 @@ fields:
 
   Symbol lines: symbol name, old size, new size, and size delta;
                 '-' means symbol added/removed;
-                '0' delta symbols not included.
+                '0' delta symbols (same size in both files) not
included.
 
-  Before:       size of all symbols in old file.
-  After:        size of all symbols in new file.
+  Before:       size of symbols in old file.
+  After:        size of symbols in new file.
   chg:          percent change.
-
-  Symbols in both files with the same size are only counted in
Before/After/chg.
+                '0' delta symbols (same size in both files) are
included.
 """

Thanks,

-- 
Mauricio
