Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702544;
	b=AtojvLI7U7MjvlQwhIFt2QlvBJUgcOyvKDorM3b3jzyXXTAAV97J+BUG05QEjvJnluAJ
	 i1b6KqC75N7u7QlbqWiGaIpy0Sg74w5ZGsFDtkmcUsFeF2syk2ZGx5O12OgjDqqG2pO44
	 Fmzatepcg1Qmd7S20B7FNpNDrgH0Fv5CM/tYsC3NH/jtOgsanpB7QdMjuoVLL6qKy9tRk
	 SW4zejWlwwYXbtBrxhgsUEAuifa07Bxs1v+i7ThPJdW1J1j0tJGZcqzXMydXxjk+c6Gn7
	 eJ9VHReHSciBviHNKLk21PNj50el70oEErZJ0tMW+WG5F2+5TkT4yZ864tBmKu6ADcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1lEvANSXqdrNCfjazgMrHQFjV+ZnDSJndNMyIH8xtRU=;
	b=jWQb/82yG4IG8r9ut3PDary1ibejRGF6JyYXSLHkweb7ntKwTgVEskpedE0j5/Vbkw6L
	 YyPAlwiclyito5MAR1sBR6nCnar6/zvc7UuIpv3jm4grA+33nUvZ4K9TbD5ev01aXD8sU
	 XJLiuQ+CfhBzu1XEgJ86aK6Doqs1pEIoJ2+Tey3OxmQwf5DB3pr7cPszcFEXVfTtIuQxZ
	 n/48gZghDeQ0jVJtzsyjqKrrg9oif5zuHqRMMt1zWEqf4wULrM0W0fjaIfwDNLX83pViQ
	 isMo9mGkk7gbj4Ikf6LotN/ETH0YjnXhoPsxNf8Yu1fQ+cKYEAfLW0hIfLyMcAVD1Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=3lYXOEvx;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAE8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AAE8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=3lYXOEvx
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jZz9C3ZrTz1XLDsl;
	Thu, 26 Nov 2026 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1795702535; x=1798294536; bh=1lEvANSXqdrNCfjazgMrHQFj
	V+ZnDSJndNMyIH8xtRU=; b=3lYXOEvxf+12rE5iYwHs8q7NbuMtzBn+TIWJXWdE
	fFuL4rNPopBM5XThtRCWxNk2uW9xfpR8ImuyBHTTtv+ayIkqSYTC3hiXvoaeOOVS
	oDcA+ifHqdGCVy0Qz0KP6UTwjn6zYEPzD5eN/CpWuxf2QTGYpb+hIolSbcZyJmBM
	/LgEGFKzIrYOAj8VG1oticQounFJ3WkGiwjvI6UX7B7hPwphIBsOcSFoEdtDOWQh
	JDRggAN5O8uc93FEwFKZXia/k07V38XOHAR0n5Hrmi104hRnO5gOUNWQv+d8z3nX
	hJB2v3j4civGPB59f5VHbYcQsscPevCa47anpprRLfNYvQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id VD6QHfTszeEf; Thu, 26 Nov 2026 14:15:35 +0000 (UTC)
Received: from [192.168.51.14] (c-24-6-239-25.hsd1.ca.comcast.net [24.6.239.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jZz926FHCz1XLyhd;
	Thu, 26 Nov 2026 14:15:34 +0000 (UTC)
Message-ID: <92a62c2c-aa24-4222-ab00-d6aeaefa9b93@acm.org>
Date: Thu, 26 Nov 2026 06:15:33 -0800
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
Subject: Re: [PATCH] compiler.h: Support 64-bit bitwise types in
 is_signed_type()
To: David Laight <david.laight.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
References: <4002a78c6bf1fa4fc96d089bd6a704bf77e2e060.1794867767.git.bvanassche@acm.org>
 <20261117080621.7ca022dd@pumpkin>
 <fb66a344-b688-4660-90e2-018d31c2a482@acm.org>
 <20261118121338.51792d61@pumpkin>
 <CAHk-=wg_njGtSQ3qCmPW1P2OWOc-74zt7G0BxOB2s1+4SnAgTQ@mail.gmail.com>
 <20261119231439.64cc05af@pumpkin>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261119231439.64cc05af@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 3:14 PM, David Laight wrote:
> On Thu, 19 Nov 2026 10:27:38 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
>> On Wed, 18 Nov 2026 at 04:13, David Laight <david.laight.linux@gmail.com> wrote:
>>>
>>> The fields ought to be u64 - since that is how they are printed.
>>
>> ... but then the actual tracing side would be worse and either require
>> a stupid and incorrect cast, or actual work to turn it into host byte
>> order.
>>
>> So clearly the printing side doesn't understand about byte order, but
>> that's a printing side issue (that nobody really cares abnout:
>> big-endian is dead, and good riddance).
>>
>> That said: I think the right fix might actually be to just allow sign
>> extension of the constants 0/-1 inside sparse for bitwise types.
>>
>> So the sparse warning "cast to restricted __le64" should just be
>> suppressed for the values that bitwise types already accept (all ones
>> and all zeroes).
> 
> I guess if sparse is going to allow the cast at all, it should sign
> extend the -1 first - the same as the compiler does.

If nobody object I will apply the patch below on the sparse codebase.

Thanks,

Bart.


[PATCH] bitwise: Allow constant ordered compares for signed
  restricted types

Allow ordered comparisons for a signed bitwise type if both operands
are integer constant expressions and at least one of them is an
unrestricted value (all zeroes or all ones). Stop reporting "degrades
to integer" for the Linux kernel is_signed_type() macro when it is
applied to a signed bitwise type.

Keep warning about ordered comparisons between a non-constant signed
bitwise value and zero because the position of the sign bit of such a
value depends on the byte order.

Document the purpose of is_unsigned_restricted_or_int() and
restricted_value() since can_order() relies on both.

Extend validation/bitwise-all-bits-and-casts.c with signed ordered
compares and with is_signed_type() tests.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
  evaluate.c                              | 32 +++++++++-
  validation/bitwise-all-bits-and-casts.c | 81 ++++++++++++++++++++-----
  2 files changed, 95 insertions(+), 18 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 927c4f35d831..97bfdaa0c769 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -484,6 +484,13 @@ static struct symbol *bad_expr_type(struct 
expression *expr)
  	return expr->ctype = &bad_ctype;
  }

+/*
+ * Check whether @sym is an unsigned integer type. A bitwise type is not an
+ * integer type itself but a SYM_RESTRICT symbol on top of an integer type.
+ * Hence look through the node, enum, bitwise, fouled and bitfield 
layers and
+ * report whether any of these layers or the underlying type is unsigned.
+ * Returns false for signed integer types and for non-integer types.
+ */
  static bool is_unsigned_restricted_or_int(struct symbol *sym)
  {
  	while (sym) {
@@ -500,6 +507,21 @@ static bool is_unsigned_restricted_or_int(struct 
symbol *sym)
  	return sym && (sym->ctype.modifiers & MOD_UNSIGNED);
  }

+/*
+ * Check whether @v must be treated as a restricted value with respect 
to the
+ * bitwise type @type. Returns 0 if @v is an unrestricted value, that is, a
+ * value that may be mixed freely with @type because its meaning does not
+ * depend on the bit or byte order, and 1 otherwise. The unrestricted 
values
+ * are:
+ * - The constant zero.
+ * - A constant that has all bits set in @type, either after it has been
+ *   extended according to its own signedness (-1, ~0) or after it has been
+ *   truncated (~0U for a 16-bit type). ~0U is restricted for a 64-bit type
+ *   since zero extension does not set the upper bits.
+ * - A regular or forced cast to an integer or bitwise type of one of the
+ *   above, except a nonzero value that is cast to an unsigned type that is
+ *   narrower than @type.
+ */
  static int restricted_value(struct expression *v, struct symbol *type)
  {
  	if (v->type == EXPR_CAST || v->type == EXPR_FORCE_CAST) {
@@ -542,12 +564,16 @@ static int restricted_value(struct expression *v, 
struct symbol *type)
  }

  /*
- * Bitwise types can do ordered comparisons with
- * the unrestricted values, but not in general
+ * Bitwise types can do ordered comparisons with the unrestricted 
values (all
+ * zeroes and all ones), but not in general. The sign bit of a signed 
bitwise
+ * type has no well-defined position, hence only allow ordered 
comparisons for
+ * signed bitwise types if both operands are integer constant 
expressions, as
+ * is the case for the Linux kernel is_signed_type() macro.
   */
  static bool can_order(struct symbol *type, struct expression *left, 
struct expression *right)
  {
-	if (!is_unsigned_restricted_or_int(type))
+	if (!is_unsigned_restricted_or_int(type) &&
+	    !(left->flags & right->flags & CEF_ICE))
  		return false;
  	return !restricted_value(left, type) ||
  		!restricted_value(right, type);
diff --git a/validation/bitwise-all-bits-and-casts.c 
b/validation/bitwise-all-bits-and-casts.c
index ae0be1269ec4..b7a322d029ca 100644
--- a/validation/bitwise-all-bits-and-casts.c
+++ b/validation/bitwise-all-bits-and-casts.c
@@ -4,6 +4,7 @@ typedef unsigned long long __attribute__((bitwise)) be64;
  typedef unsigned int __attribute__((bitwise)) be32;
  typedef unsigned short __attribute__((bitwise)) be16;
  typedef signed int __attribute__((bitwise)) sbe32;
+typedef signed long long __attribute__((bitwise)) sbe64;

  static be32 test_all_bits(void)
  {
@@ -63,19 +64,58 @@ static int test_ordered_compare(be32 x, be16 y)
  	return res;
  }

-static void test_bad_narrow_and_signed(sbe32 sx)
+static int test_signed_constant_compare(void)
+{
+	int res = 0;
+	if ((sbe32)-1 < (sbe32)0)
+		res++;
+	if ((sbe64)0 >= (sbe64)~0)
+		res++;
+	if ((__force sbe64)1 > (sbe64)-1)
+		res++;
+	return res;
+}
+
+#define is_signed_type(type) (((type)(-1)) < (__force type)1)
+
+static int test_is_signed_type(void)
+{
+	_Static_assert(!is_signed_type(be16), "be16");
+	_Static_assert(!is_signed_type(be32), "be32");
+	_Static_assert(!is_signed_type(be64), "be64");
+	_Static_assert(is_signed_type(sbe32), "sbe32");
+	_Static_assert(is_signed_type(sbe64), "sbe64");
+
+	return is_signed_type(be64) + is_signed_type(sbe64);
+}
+
+static void test_bad_narrow_and_signed(sbe32 sx, sbe32 sy, sbe64 sz)
  {
  	be64 bad_u32 = ~0U;
  	be32 bad_u16 = (unsigned short)~0;
  	be32 bad_c16 = (be16)~0;
  	be32 bad_f16 = (__force be16)~0;
-	int bad_ord = (sx > 0);
+	int bad_ord = (sx > sy);
+	int bad_val = (sx > 1);
+	int bad_gt0 = (sx > 0);
+	int bad_lt0 = (0 < sx);
+	int bad_m1 = (sx < -1);
+	int bad_ge0 = (sz >= 0);
+	int bad_not0 = (sz < ~0);
+	int bad_cst = ((sbe32)1 < (sbe32)2);

  	(void)bad_u32;
  	(void)bad_u16;
  	(void)bad_c16;
  	(void)bad_f16;
  	(void)bad_ord;
+	(void)bad_val;
+	(void)bad_gt0;
+	(void)bad_lt0;
+	(void)bad_m1;
+	(void)bad_ge0;
+	(void)bad_not0;
+	(void)bad_cst;
  }

  /*
@@ -83,18 +123,29 @@ static void test_bad_narrow_and_signed(sbe32 sx)
   * check-command: sparse -Wbitwise $file
   *
   * check-error-start
-bitwise-all-bits-and-casts.c:68:24: warning: incorrect type in 
initializer (different base types)
-bitwise-all-bits-and-casts.c:68:24:    expected restricted be64 
[usertype] bad_u32
-bitwise-all-bits-and-casts.c:68:24:    got unsigned int
-bitwise-all-bits-and-casts.c:69:25: warning: incorrect type in 
initializer (different base types)
-bitwise-all-bits-and-casts.c:69:25:    expected restricted be32 
[usertype] bad_u16
-bitwise-all-bits-and-casts.c:69:25:    got unsigned short
-bitwise-all-bits-and-casts.c:70:25: warning: incorrect type in 
initializer (different base types)
-bitwise-all-bits-and-casts.c:70:25:    expected restricted be32 
[usertype] bad_c16
-bitwise-all-bits-and-casts.c:70:25:    got restricted be16 [usertype]
-bitwise-all-bits-and-casts.c:71:25: warning: incorrect type in 
initializer (different base types)
-bitwise-all-bits-and-casts.c:71:25:    expected restricted be32 
[usertype] bad_f16
-bitwise-all-bits-and-casts.c:71:25:    got restricted be16 [usertype]
-bitwise-all-bits-and-casts.c:72:24: warning: restricted sbe32 degrades 
to integer
+bitwise-all-bits-and-casts.c:94:24: warning: incorrect type in 
initializer (different base types)
+bitwise-all-bits-and-casts.c:94:24:    expected restricted be64 
[usertype] bad_u32
+bitwise-all-bits-and-casts.c:94:24:    got unsigned int
+bitwise-all-bits-and-casts.c:95:25: warning: incorrect type in 
initializer (different base types)
+bitwise-all-bits-and-casts.c:95:25:    expected restricted be32 
[usertype] bad_u16
+bitwise-all-bits-and-casts.c:95:25:    got unsigned short
+bitwise-all-bits-and-casts.c:96:25: warning: incorrect type in 
initializer (different base types)
+bitwise-all-bits-and-casts.c:96:25:    expected restricted be32 
[usertype] bad_c16
+bitwise-all-bits-and-casts.c:96:25:    got restricted be16 [usertype]
+bitwise-all-bits-and-casts.c:97:25: warning: incorrect type in 
initializer (different base types)
+bitwise-all-bits-and-casts.c:97:25:    expected restricted be32 
[usertype] bad_f16
+bitwise-all-bits-and-casts.c:97:25:    got restricted be16 [usertype]
+bitwise-all-bits-and-casts.c:98:24: warning: restricted sbe32 degrades 
to integer
+bitwise-all-bits-and-casts.c:98:29: warning: restricted sbe32 degrades 
to integer
+bitwise-all-bits-and-casts.c:99:24: warning: restricted sbe32 degrades 
to integer
+bitwise-all-bits-and-casts.c:100:24: warning: restricted sbe32 degrades 
to integer
+bitwise-all-bits-and-casts.c:101:28: warning: restricted sbe32 degrades 
to integer
+bitwise-all-bits-and-casts.c:102:23: warning: restricted sbe32 degrades 
to integer
+bitwise-all-bits-and-casts.c:103:24: warning: restricted sbe64 degrades 
to integer
+bitwise-all-bits-and-casts.c:104:25: warning: restricted sbe64 degrades 
to integer
+bitwise-all-bits-and-casts.c:105:25: warning: cast to restricted sbe32
+bitwise-all-bits-and-casts.c:105:36: warning: cast to restricted sbe32
+bitwise-all-bits-and-casts.c:105:25: warning: restricted sbe32 degrades 
to integer
+bitwise-all-bits-and-casts.c:105:36: warning: restricted sbe32 degrades 
to integer
   * check-error-end
   */

