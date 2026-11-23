Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444721;
	b=oeSSGAo+YFG2zwmNrBeE7kwo5p/ga/A91xUeWKMDA+dKyTdoUDL59tTsmRrMmE7mpU95
	 sPbFG8o82reBSve8ctuvHAYFKXvE6MD5Gfb8eXC0dmWrb6X/8I100QdKxjdn/sn2esNhq
	 dhWe5TdIKhFsitG4WmQOr+353PtiQgvKkwmpLXlHkD63GEEcM+f13h8vNJfK+b6UKLmtd
	 Bgwqff3kQWVn2f3XvFRsx+Qys8rgfICF+dd305cHEe1jGdvmA3yYuf43Lp2rfXmmo6Tev
	 XPnV4wknuGcmfyN57hu7To1q4h+7bjVKGa8bir1+fv8Sl5drVQU5O9iR4HPKQW0IScg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444721;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Content-Type:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To;
	bh=A1fTZ2InVFPiAYOtFoqbe75R7SeLzXjDMJ64o4R07vY=;
	b=MvW9v+yLSQGtkMEJjFKDvmGt0oF0Ka5TS/WiclzJt8qMqe1asnC/6OpeTLY1w8v6+IsE
	 jLQmPgVBurhPXp/hT0yINTMZqyyhqk2eOEjDLN7QFep+W9OyGFjckdYw5zUsvXsoWwi4B
	 X7WW437gWh7AREvRKt4kH7myHMtG1XuQv6NxBPsbhslchoNg2O3ExxocR0rJV471gwv+6
	 ZPNVeKDgFJhnbuVJ0IEPpwTDaxpo3l5JdXudSNt2eDvypYQYbCvriKhHpcNPUcrpCVmCQ
	 8loDaSn2Dbe4ZD4VjnZTHUexDrROSHoYokWAX+Znzi1UCNomfDjCWJDxAP1lNYlEuZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CUEeBNIQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F25606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F25606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CUEeBNIQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E0FD143D;
	Mon, 23 Nov 2026 06:38:37 -0800 (PST)
Received: from [10.57.71.117] (unknown [10.57.71.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7EE73F632;
	Mon, 23 Nov 2026 06:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795444719; bh=pm0Ulpq3W4vRUiQm7gy8AfW5DkREBOidml8L3B7/Z98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CUEeBNIQqDgMONM/1Az0yC6fZ+tw7FpBmWngL8mAjgzU5OZH+BTp63dVQOtwA/XpE
	 jRWJ6eNZ5CD7k2wJ3+FUm6vhLy6aPnDpydYBe2QZFrz6lc7FJFYAHvahCvY37yctPR
	 FH37xeFfxNsiIrdaHvCjzz6FYwvgLQvkk2itkkro=
Content-Type: multipart/mixed; boundary="------------mBfCqRximwE0YWZD2pDJUVqY"
Message-ID: <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com>
Date: Mon, 23 Nov 2026 14:38:35 +0000
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
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Kayra Cizmeci <kayracizmeci@gmail.com>,
 Wei Wang <wvw@google.com>
References: <20261121041507.39582-1-qyousef@layalina.io>
 <20261121041507.39582-2-qyousef@layalina.io>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <20261121041507.39582-2-qyousef@layalina.io>

This is a multi-part message in MIME format.
--------------mBfCqRximwE0YWZD2pDJUVqY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 04:15, Qais Yousef wrote:
> Static keys are not guaranteed to be enabled atomically across CPUs.  Or
> across callsites on the same CPUs. Which means when sched_uclamp_used is
> enabled, some CPUs/callsites will return true for uclamp_is_used() while
> others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
> decrement without increment this is safe as documented in the code. But
> an increment without a decrement is a problem and will leave the
> uclamp_rq in a corrupt state.

So if we only need decrement to work then we can rely on
p's uclamp_se.active and decrement regardless of uclamp_is_used() and call it
a day?
See the attached patch.

> 
> The reported case seems to happen due to callsites on the same CPU not
> seeing the flipped state.
> 
> Plugging the race is hard as discussed in [1]. Take it for granted and
> do correction actions on going to idle to guarantee this state is
> transient for a short period after uclamp_sched_used is enabled.
> 
> [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
> 
> Reported-by: Wei Wang <wvw@google.com>
> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> ---
>  kernel/sched/core.c  |  2 +-
>  kernel/sched/idle.c  | 19 +++++++++++++++++++
>  kernel/sched/sched.h |  3 +++
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d7c3b43158dea..c6780358a7975 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
>  	uclamp_update_util_min_rt_default(p);
>  }
>  
> -static void __init init_uclamp_rq(struct rq *rq)
> +void init_uclamp_rq(struct rq *rq)
>  {
>  	enum uclamp_id clamp_id;
>  	struct uclamp_rq *uc_rq = rq->uclamp;
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index 76f3c84ca6846..84301fc49e699 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>  	 * lost_idle_time of clock_pelt
>  	 */
>  	update_idle_rq_clock_pelt(rq);
> +
> +	/*
> +	 * Due to a race condition when enabling sched_uclamp_used static key,
> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> +	 * the static key flipped. The race condition is unlikely, but ensure
> +	 * the uclamp_rq() state is set properly on each entry to idle.
> +	 *
> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
> +	 * lost. Since we are imbalanced, hard to know what is right. So just
> +	 * cleanup. This should be a transient error state once we recover
> +	 * everything should work as expected.
> +	 *
> +	 * We need to be careful of some paths that can force idle with tasks
> +	 * are still queued.

It wouldn't hurt spelling these paths out IMO.

> +	 */
> +	if (uclamp_is_used() &&
> +	    !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> +		init_uclamp_rq(rq);

I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for .value at least?

>  }
>  
>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 7d2ec527b8a25..d87bdbd2121df 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
>  #ifdef CONFIG_UCLAMP_TASK
>  
>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> +void init_uclamp_rq(struct rq *rq);
>  
>  /*
>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
> @@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
>  	return SCHED_CAPACITY_SCALE;
>  }
>  
> +static inline void init_uclamp_rq(struct rq *rq) {}
> +
>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
>  
>  static inline bool uclamp_is_used(void)

--------------mBfCqRximwE0YWZD2pDJUVqY
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-sched-uclamp-Always-account-active-clamps-on-dequeue.patch"
Content-Disposition: attachment;
 filename*0="0001-sched-uclamp-Always-account-active-clamps-on-dequeue.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0N2RlOGY3YTM2NGJmZGFhMTFhYWIxNzBlMDk2MDhhODJlZmI1Yjg4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpc3RpYW4gTG9laGxlIDxjaHJpc3RpYW4ubG9l
aGxlQGFybS5jb20+CkRhdGU6IE1vbiwgMjMgTm92IDIwMjYgMTM6NTk6MDEgKzAwMDAKU3Vi
amVjdDogW1BBVENIXSBzY2hlZC91Y2xhbXA6IEFsd2F5cyBhY2NvdW50IGFjdGl2ZSBjbGFt
cHMgb24gZGVxdWV1ZQoKRW5hYmxpbmcgc2NoZWRfdWNsYW1wX3VzZWQgZG9lcyBub3QgdXBk
YXRlIGFsbCBzdGF0aWMta2V5IGNhbGxzaXRlcwphdG9taWNhbGx5LiBBbiBlbnF1ZXVlIGNh
biBvYnNlcnZlIHRoZSBrZXkgZW5hYmxlZCBhbmQgaW5jcmVtZW50IGEgdGFzaydzCnVjbGFt
cCBidWNrZXRzIHdoaWxlIGEgc3Vic2VxdWVudCBkZXF1ZXVlIHN0aWxsIG9ic2VydmVzIGl0
IGRpc2FibGVkIGFuZApza2lwcyB0aGUgZGVjcmVtZW50LiBUaGlzIGxlYXZlcyBzdGFsZSBi
dWNrZXQgcmVmZXJlbmNlcyBhbmQgYWN0aXZlIGJpdHMsCndoaWNoIGNhbiBrZWVwIHRoZSBy
dW5xdWV1ZSBjbGFtcHMgZWxldmF0ZWQgYWZ0ZXIgdGhlIHRhc2sgc2xlZXBzIG9yCm1pZ3Jh
dGVzLgoKUmVtb3ZlIHRoZSBzdGF0aWMta2V5IGNoZWNrIGZyb20gdWNsYW1wX3JxX2RlYygp
LiB1Y2xhbXBfcnFfZGVjX2lkKCkKYWxyZWFkeSBjaGVja3MgZWFjaCBjbGFtcCdzIGFjdGl2
ZSBiaXQsIHdoaWNoIHJlY29yZHMgd2hldGhlciB0aGUgdGFzawpjb250cmlidXRlZCB0byB0
aGF0IGJ1Y2tldC4gVGFza3MgZW5xdWV1ZWQgYmVmb3JlIGFjY291bnRpbmcgd2FzIGVuYWJs
ZWQKdGhlcmVmb3JlIHN0aWxsIHNraXAgdGhlIGRlY3JlbWVudCwgd2hpbGUgYWNjb3VudGVk
IHRhc2tzIHJlbGVhc2UgdGhlaXIKcmVmZXJlbmNlcyByZWdhcmRsZXNzIG9mIHRoZSBzdGF0
aWMta2V5IHVwZGF0ZSBwcm9ncmVzcy4gVGhlIGV4aXN0aW5nCnJ1bnF1ZXVlIGxvY2tpbmcg
c2VyaWFsaXplcyB0aGVzZSB1cGRhdGVzLgoKUmVwb3J0ZWQtYnk6IFdlaSBXYW5nIDx3dndA
Z29vZ2xlLmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FORGhO
Q3F5WHNaNkc3N3orOXM9clRPNkJaaWZSRzkraFZ4TVRhaCt0QXY2cEI2aDN3QG1haWwuZ21h
aWwuY29tLwpTdWdnZXN0ZWQtYnk6IFdlaSBXYW5nIDx3dndAZ29vZ2xlLmNvbT4KRml4ZXM6
IDQ2NjA5Y2UyMjcwMyAoInNjaGVkL3VjbGFtcDogUHJvdGVjdCB1Y2xhbXAgZmFzdCBwYXRo
IGNvZGUgd2l0aCBzdGF0aWMga2V5IikKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIExvZWhs
ZSA8Y2hyaXN0aWFuLmxvZWhsZUBhcm0uY29tPgotLS0KIGtlcm5lbC9zY2hlZC9jb3JlLmMg
fCAxMyArKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2tlcm5lbC9zY2hlZC9jb3JlLmMgYi9rZXJu
ZWwvc2NoZWQvY29yZS5jCmluZGV4IDUxNWI5ZDAzNTNjZS4uM2MxNDFhYWFlNmE3IDEwMDY0
NAotLS0gYS9rZXJuZWwvc2NoZWQvY29yZS5jCisrKyBiL2tlcm5lbC9zY2hlZC9jb3JlLmMK
QEAgLTE1OTgsOCArMTU5OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgdWNsYW1wX3NlIHVjbGFtcF9k
ZWZhdWx0W1VDTEFNUF9DTlRdOwogCiAvKgogICogVGhpcyBzdGF0aWMga2V5IGlzIHVzZWQg
dG8gcmVkdWNlIHRoZSB1Y2xhbXAgb3ZlcmhlYWQgaW4gdGhlIGZhc3QgcGF0aC4gSXQKLSAq
IHByaW1hcmlseSBkaXNhYmxlcyB0aGUgY2FsbCB0byB1Y2xhbXBfcnFfe2luYywgZGVjfSgp
IGluCi0gKiBlbnF1ZXVlL2RlcXVldWVfdGFzaygpLgorICogZGlzYWJsZXMgdWNsYW1wX3Jx
X2luYygpIGFjY291bnRpbmcgaW4gZW5xdWV1ZV90YXNrKCkuCiAgKgogICogVGhpcyBhbGxv
d3MgdXNlcnMgdG8gY29udGludWUgdG8gZW5hYmxlIHVjbGFtcCBpbiB0aGVpciBrZXJuZWwg
Y29uZmlnIHdpdGgKICAqIG1pbmltdW0gdWNsYW1wIG92ZXJoZWFkIGluIHRoZSBmYXN0IHBh
dGguCkBAIC0xODk5LDE0ICsxODk4LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1Y2xhbXBf
cnFfZGVjKHN0cnVjdCBycSAqcnEsIHN0cnVjdCB0YXNrX3N0cnVjdCAqcCkKIAllbnVtIHVj
bGFtcF9pZCBjbGFtcF9pZDsKIAogCS8qCi0JICogQXZvaWQgYW55IG92ZXJoZWFkIHVudGls
IHVjbGFtcCBpcyBhY3R1YWxseSB1c2VkIGJ5IHRoZSB1c2Vyc3BhY2UuCi0JICoKLQkgKiBU
aGUgY29uZGl0aW9uIGlzIGNvbnN0cnVjdGVkIHN1Y2ggdGhhdCBhIE5PUCBpcyBnZW5lcmF0
ZWQgd2hlbgotCSAqIHNjaGVkX3VjbGFtcF91c2VkIGlzIGRpc2FibGVkLgorCSAqIFN0YXRp
Yy1rZXkgdXBkYXRlcyBhcmUgbm90IGF0b21pYyBhY3Jvc3MgY2FsbHNpdGVzLiBBbiBlbnF1
ZXVlIG1heQorCSAqIGhhdmUgYWNjb3VudGVkIHRoaXMgdGFzayBiZWZvcmUgdGhpcyBjYWxs
c2l0ZSBvYnNlcnZlcyB0aGUga2V5IGVuYWJsZWQuCisJICogTGV0IHVjbGFtcF9ycV9kZWNf
aWQoKSB1c2UgdWNfc2UtPmFjdGl2ZSB0byBtYXRjaCB0aGF0IGFjY291bnRpbmcuCiAJICov
Ci0JaWYgKCF1Y2xhbXBfaXNfdXNlZCgpKQotCQlyZXR1cm47Ci0KIAlpZiAodW5saWtlbHko
IXAtPnNjaGVkX2NsYXNzLT51Y2xhbXBfZW5hYmxlZCkpCiAJCXJldHVybjsKIAotLSAKMi4z
NC4xCgo=

--------------mBfCqRximwE0YWZD2pDJUVqY--
