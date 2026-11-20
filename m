Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.203.187.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167898;
	b=IClwkpxgiXz35ADscdZLH2VBFkBPeymCMKqev+iQvTCOr266n9dU1FCui+mwrUOnhvMU
	 IglrKn1iMRmlF1PbWwrQZ+h1CoZvRTEw9Xu51RXmckUOXY/9mxJHr7yljfDYf6TIL5dQR
	 v0YJ2A5MkCjwOP29U1mHFWI7rAsmJVTe4F46qkLRKk2mrg7c1IMV4h6jLjl6M30Obm61b
	 p/guXEUgf/DhiVpwlAmrgsSOLZE1X6PzP2zIokCJYp89BEvXThjfKG1yecTXGJFfGZ3JC
	 u5bIK5/4sObggo+f2tli9KzkZQjM7cUHvXIYq2zaNF8LvaKMz3zik0FbKKV6sQvdeCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167898;
	h=DMARC-Filter:DKIM-Signature:X-Auth-ID:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Classification-ID;
	bh=F5FWboMaK88fuBWtNI7cbS6MCyqBOyEKQ0c6VV+JMgI=;
	b=Xfsnw0D0FzXdamOekhhg8bO+r114rIBw245jwsIHmTVCwFdYFDcrQCknYef4Qras9Wkr
	 piTxpMfroqxUXFsowp9cq4yzelA59VPpbpBWpWm4ezqX2DTUepule67KAd/IdORD8TP9h
	 D5B5/d0p7/5mprJBWrrgRb6b1iot0TBYXpv46I74nIMs2kn2EhgUmyKZKkhBkfDuL/zT+
	 LUoJhJgG195p5Z/KwHrYr3hAGYH8dyEa+x2aRMfORvlIVI+D8ON1T7vtmICaiZb/m9R/f
	 zyZIn3wtFbNoWK5ssuXNeavN14ZwUr7JNGQWK3kgSLpudbJWal0mtP1N+j76w3U+tsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mev.co.uk;
	spf=pass smtp.mailfrom=mev.co.uk;
	dkim=pass header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b="YnEtRFu/";
	arc=none smtp.remote-ip=173.203.187.110
Received: from smtp110.iad3a.emailsrvr.com (smtp110.iad3a.emailsrvr.com [173.203.187.110])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD4606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57BD4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=YnEtRFu/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1795167890;
	bh=AqrD+cEbs/eounHrHar+b5y5mRim/WHl/zuRHiy41bo=;
	h=Date:Subject:To:From:From;
	b=YnEtRFu/h9IkLxzdtlW9vF0oObopKzaQblsUtXMlEnYBSF2wK2BJJeDdK8I1ms/Ro
	 G5Wi/gFv3ePcUuGM/gh+8fthCXvcRcmJ6FRHwVfd2ZGEMJDJFQ8X7CUbteWRJgzJLf
	 GB47flDbi4AkiblA6VG9hddvEDDBIkxjhSwR2k8o=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp6.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 1B1825145;
	Fri, 20 Nov 2026 04:44:50 -0500 (EST)
Message-ID: <cd79cc38-c094-498b-b5d8-4cc2f01d1c0d@mev.co.uk>
Date: Fri, 20 Nov 2026 09:44:49 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] comedi: ni_routing: fix SyntaxWarning in
 convert_csv_to_c.py
To: Ilyas N <desobei@outlook.com>,
 H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
References: <PH7PR19MB66586FC98045CEA8D5067BDCAF792@PH7PR19MB6658.namprd19.prod.outlook.com>
Content-Language: en-US
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <PH7PR19MB66586FC98045CEA8D5067BDCAF792@PH7PR19MB6658.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 09266d8d-8371-4fa8-a17a-ace8220394d9-1-1

On 2026-11-19 21:31, Ilyas N wrote:
> convert_csv_to_c.py validates register values against the regex
> '[VIU]\([^)]*\)', written as a plain string literal. "\(" and "\)" are
> not valid Python escape sequences, so with Python 3.12 and later every
> run of the script (e.g. "make c-files") prints:
> 
>    convert_csv_to_c.py:47: SyntaxWarning: "\(" is an invalid escape sequence. Such sequences will not work in the future. Did you mean "\\("? A raw string is also an option.
> 
> Python currently keeps unrecognized escapes verbatim, so the regex still
> works, but the script will stop compiling once this warning becomes an
> error.
> 
> Use a raw string. The resulting string is identical, so there is no
> functional change.
> 
> The problem was found by compiling all in-tree Python files with Python
> 3.14 and SyntaxWarning promoted to an error. The search and this patch
> were done with the help of an AI coding assistant (Claude Opus 5.5).
> Tested by checking that the script now compiles cleanly with warnings
> as errors, that its compiled bytecode, constants and names are
> unchanged, and that the regex still accepts all 95 register values used
> in the ni_route_values tables.
> 
> Signed-off-by: Ilyas N <desobei@outlook.com>
> ---
> v2: Use my real name in From: and Signed-off-by:, as Greg's patch bot
>      asked. No code changes.
> 
> v1: https://lore.kernel.org/all/PH7PR19MB66587C2BE5E8E94F693B4F14AF7A2@PH7PR19MB6658.namprd19.prod.outlook.com/
> 
>   drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
> index 90378fb50580..d19101fc2a94 100755
> --- a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
> +++ b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
> @@ -44,7 +44,7 @@ def routedict_to_structinit_single(name, D, return_name=False):
>   
>       lines.append('\t\t[B({})] = {{'.format(D0_sig))
>       for D1_sig, value in D1:
> -      if not re.match('[VIU]\([^)]*\)', value):
> +      if not re.match(r'[VIU]\([^)]*\)', value):
>           sys.stderr.write('Invalid register format: {}\n'.format(repr(value)))
>           sys.stderr.write(
>             'Register values should be formatted with V(),I(),or U()\n')

Thanks for the fix!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

