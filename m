Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123913;
	b=H46eFltY6rGmeMojEE+03bsnSBrdeUPxE5Osn48cKXEf8/ONMPQjJgHY7e1ZYgVH5/Ve
	 lQ5/b3ehjDOTUbbGfjGkqBG8hbDUdwIX5zVwlostYUo5PAhZoRRRDjb2i39DtE+c5nFeZ
	 ep102LpaEzrkRhSZjVTeL3NclPW346HASWOSNF08O5PLNs+IaNJYHW9IS41g6rt2LuKlh
	 LGCjz/i/QvTAURD19rl/cfzMUCCOnH66YnoeRuiZp/Cg1pIU6pH++PJLbPTzqeFFL1L1q
	 jlsvhzADbXO5g2+8OYowvxe6b/56KiRM0OGLqTkGJ3Fiqavd3N1OMUrV0YQh8ituJBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EKMky9BmEldC1ZjWvRwiP1TMZLLwKdRq88rm8KzCg5E=;
	b=OA0oMBh3PP/IbKhT2hHSHtXd8TOGK9NZsBoR2S9+QHeTdGr6t4Q9ACSNVNu6KqbhwHrW
	 3pCNQC5iW+35fV6Fd90ggx4Page0h4vJXiAHovuvGYiOfsSaBSthTQ4nHkUpwodxQHr2W
	 8zrQzQHn4DorVBeHQ0gqUkfqFC2kA6m45ZrKigdx7v2rI1VIM+vEM+Ys6+n9GrCnuh3/d
	 HrWB5rw/7WbDk1GlFjbfK6cd0uQeQ8dhk2bwC0kr2QDCuxV/imMbzVngrGPGMLBbPy8l5
	 SHeAMHovwteACyDW1pNyYN+2Nsgo33IVEhQkLbYZLEMo16YVOtbOY3x2pYJGsnL1PbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=LmhSyxD7;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F090E606A339
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F090E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=LmhSyxD7
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jVs9h3R1WzlpJ4g;
	Thu, 19 Nov 2026 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1795123908; x=1797715909; bh=EKMky9BmEldC1ZjWvRwiP1TM
	ZLLwKdRq88rm8KzCg5E=; b=LmhSyxD7TeVCF2TwtRQViANgWdlJqo9EnLCffWLO
	CF/77GPSmfTzYxZGaeGA0ZuqPx0bnBTed02BT/Ek8/0EiZ7+uxio7/v5PV6pCRFT
	E4VXXw59CF6AJkubgKFN3KVgngdWoolfRlT0qLetOI9GOYrpxnlqqB0TTidd4rHg
	JpiPt85amw0qTQ2k6EiyCC9VuAC8X13Vmw82PUuLAmosrZtx1ysab23osnWPf/0N
	pC1QAknx0vY/6jx3PvDiBkQSZM6c3leH4wgrSpzCDOf4OTR+mFGVwsyQcJOHGSx4
	pxQIWK0caccQ9lzFS1EngXOcbXnwY+lTD0thyvh+s/j31g==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id oWxSVa8pN1fs; Thu, 19 Nov 2026 21:31:48 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:3bd4:4c06:4b28:5d89] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jVs9b6wHbzlfcVC;
	Thu, 19 Nov 2026 21:31:47 +0000 (UTC)
Message-ID: <591a87fb-042e-417c-b9bd-32e3b9cb645f@acm.org>
Date: Thu, 19 Nov 2026 13:31:47 -0800
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
Subject: Re: [PATCH] coccinelle: locks: Add must_hold.cocci
To: Marco Elver <elver@google.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 cocci@inria.fr, kasan-dev@googlegroups.com
References: <20261119210807.211041-1-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261119210807.211041-1-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 1:07 PM, Marco Elver wrote:
> Clang's context analysis treats lockdep_assert_held*() as an assumption
> that the lock is held. A function that asserts instead of being
> annotated with __must_hold() therefore passes the analysis, but its
> callers are never checked.
Hi Marco,

The LLM I asked for help with reviewing this patch provided the
following feedback (not sure all of this is correct):

 >   drivers/nvme/host/fabrics.c:650:1-20: nvmf_lookup_transport() 
asserts &nvmf_transports_rwsem is held but lacks 
__must_hold(&nvmf_transports_rwsem)

This suggestion is wrong. The only caller of nvmf_lookup_transport()
holds nvmf_transports_rwsem as a reader:

	down_read(&nvmf_transports_rwsem);
	ops = nvmf_lookup_transport(opts);

Hence, the correct annotation is __must_hold_shared() and adding
__must_hold() would trigger a new context analysis warning in the
caller. lockdep_assert_held() succeeds if a lock is held in any mode, so
for that macro the script cannot know which of the two annotations is
appropriate. How about reporting "lacks __must_hold() or
__must_hold_shared()" for lockdep_assert_held() and keeping the specific
suggestion for the _write() and _read() variants only?

 > +	# Attributes on a prototype in the same file.
 > +	for d in re.finditer(r'\b%s\s*\([^;{}]*\)([^;{}]*);' % re.escape(f),
 > +			     ''.join(lines)):
 > +		if '__must_hold' in d.group(1):
 > +			return None

It seems to me that this test never succeeds. '[^;{}]*\)' is greedy and
hence matches up to the last ')' before the semicolon. That is the
closing parenthesis of the attribute itself, so group 1 is empty:

 >>> import re
 >>> s = 'static int foo(struct x *x) __must_hold(&x->lock);'
 >>> re.search(r'\bfoo\s*\([^;{}]*\)([^;{}]*);', s).group(1)
''

The result is the same if the attribute occurs on the next line. I think
that this will cause functions that are only annotated on a forward
declaration to be reported. Testing d.group(0) instead of d.group(1)
would fix this. Additionally, should this test use the same attribute
list as the test above it (__releases*(), __context_unsafe(),
__no_context_analysis)?

 > +@r@
 > +identifier f;
 > +parameter list ps;
 > +expression E;
 > +position pf, p;
 > +@@
 > +
 > +f@pf(ps)
 > +{
 > +	...
 > +(
 > +	lockdep_assert_held@p(E);
 > +|
 > +	lockdep_assert_held_write@p(E);
 > +|
 > +	lockdep_assert_held_read@p(E);
 > +)
 > +	...
 > +}

Is my understanding correct that the default for a rule without
'-', '+' or '*' annotations is "exists" instead of "forall"? If so, this
rule also matches conditional assertions, e.g. this code from
fs/btrfs/backref.c:

	if (!current->journal_info)
		lockdep_assert_held(&fs_info->commit_root_sem);

__must_hold() would be wrong for such functions, and the above does not
match "assert on all paths" from the patch description nor
"unconditionally assert" from the comment at the top of the script.
Please consider specifying "forall" or "exists" explicitly.

Additionally, this rule matches functions that acquire E themselves
before asserting that it is held. Can these be excluded, e.g. with a
"when" constraint on the first "..."?

 > +	m = re.match(r'[&(]*(\w+)', e)
 > +	if not m:
 > +		return None
 > +	params = re.findall(r'(\w+)\s*(?:\[[^\]]*\]\s*)*(?:,|$)', str(ps))
 > +	if m.group(1) not in params and not re.fullmatch(r'&\w+', e):
 > +		return None	# Local alias: cannot be named in an attribute.

Only the first identifier of E is checked. Expressions like
&tbl->locks[idx] with 'tbl' a parameter and 'idx' a local variable are
reported although these cannot be used as an attribute argument. Would
it be possible to verify that all identifiers that occur in E are either
parameters or struct member names?

The 'params' regular expression does not extract the correct name for
all parameter declarations:

'void (*cb)(struct foo *), int n'    -> ['n']
'int (*fn)(void *data, int x)'       -> ['data']
'struct task_struct *p __maybe_unused' -> ['__maybe_unused']

Is there a way to let Coccinelle provide the parameter names instead of
extracting these with a regular expression?

 > +	static = 'static' in ''.join(lines[max(first - 3, 0):first])

This is a substring search across three lines, so e.g. a
"static int counter;" declaration two lines above a non-static function
suppresses the "check prototype" hint. Can 'static' be matched in the
SmPL rule instead?

Some further remarks:
- lockdep_assert_held_once() and assert_spin_locked() are not handled
   (71 respectively 256 occurrences in .c files in my tree), nor are
   wrappers like lockdep_assert_wiphy(). Please either add these or
   mention this in the "Limitations" section.
- Global locks are only recognized if E has the form "&name".
   Expressions like &init_mm.mmap_lock are skipped silently. That's fine
   with me but it is not mentioned in the comment at the top.
- The patch description mentions that functions with a __must_hold*()
   or __releases*() annotation are skipped. The script also skips
   functions annotated with __context_unsafe() or __no_context_analysis.

Thanks,

Bart.

