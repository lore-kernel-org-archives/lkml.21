Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586527;
	b=5tQeIqB04thPUhtMfMKGUDivZlqLKgSubTJ1xAZm1/bXhnOwNPf2L2ucd18sqb7o26wr
	 wZLLNioMmIAAUg3KZQfUlls7MM/ripFUM57pOJDQkZ/k3afvOdAtKUTupFRFOjjAf6Up3
	 Kqjta1n0Y33IbIzxg3N6t9LDQJC8o2uColR4DrE+ne9PUAipSwkuoZ1w6sdh4aC0or+AJ
	 h0CVEcTdSJUwbnUA7OpqXsNiD7FkxqXQvTDKhMK7KUpSPG7rGptAT0vCCJPXZu0bt5PPZ
	 e4CQdFeVKu9rSefatrmMizjS4SOLyCvN1thM5Ak1IHE/gfHo0Q/PztO3neEYdNXVyUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586527;
	h=DMARC-Filter:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Hii0aBtwDU5EzWigN3Rbycst6/HZem0Wav4RGMQ0Sc0=;
	b=SBbfPmjcVT9wnHyfooj0NJmQyeSoMTu6nNlj2kGgwH4wYqya74LSr2P9nQCKwwJaLzeF
	 8E/vXj9+0gaaAHj9aMavi1QJWRXxUi/CzHzh+oDL+EeqrdJpyRlYu+pwmGQ8nrpdNNp5p
	 LRl0So8qPNfDNkV+ypx9XVL9FU9beRdpLTXY3oq+PvC80uYSi+cZA1BRY7m53GJNGGDUA
	 iamMzkVnOhRCIsK82fEOOfYXBRRuytKTHAoYXB4+6z8vhpu0uuCF+tc57dpO4Ls/r/cnT
	 o8mNTTWMs2fa0ePOIK1mf8tyehXAUyHLluSJH0WiaS0VzaAlbGnNmgkcskW+hMg9v5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56724606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56724606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jZ8Fp26wSzg1cV;
	Wed, 25 Nov 2026 14:01:50 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jZ8Fm5lJVzg1cV;
	Wed, 25 Nov 2026 14:01:48 +0800 (CST)
Received: from cncheex05.Hygon.cn (unknown [172.23.18.115])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 50B26DC0E;
	Wed, 25 Nov 2026 14:01:42 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex05.Hygon.cn
 (172.23.18.115) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 25 Nov
 2026 14:01:48 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Wed, 25 Nov 2026 14:01:48 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Chen Yu <yu.c.chen@intel.com>
CC: "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"tim.c.chen@linux.intel.com" <tim.c.chen@linux.intel.com>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>, "vschneid@redhat.com"
	<vschneid@redhat.com>, "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jianyong.wu@outlook.com" <jianyong.wu@outlook.com>, Yibin Liu
	<liuyibin@hygon.cn>, Yuan Zhong <zhongyuan@hygon.cn>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
Subject: RE: [PATCH v2] sched/cache: Enable LLC aggregation above the first
 NUMA level
Thread-Topic: [PATCH v2] sched/cache: Enable LLC aggregation above the first
 NUMA level
Thread-Index: AQHdcnNThxnu07L7qkqP0oGmwnBzFrc0v7yAgAlx2fA=
Date: Wed, 25 Nov 2026 06:01:48 +0000
Message-ID: <497d83de86d54fc3a390862f23cd6a57@hygon.cn>
References: <20261112065445.592968-1-wujianyong@hygon.cn>
 <av7XHYkg+XLO+Xm4@chenyu-dev>
In-Reply-To: <av7XHYkg+XLO+Xm4@chenyu-dev>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Chenyu,

> -----Original Message-----
> From: Chen Yu <yu.c.chen@intel.com>
> Sent: Thursday, November 19, 2026 7:02 PM
> To: Jianyong Wu <wujianyong@hygon.cn>
> Cc: mingo@redhat.com; peterz@infradead.org; juri.lelli@redhat.com;
> vincent.guittot@linaro.org; tim.c.chen@linux.intel.com;
> dietmar.eggemann@arm.com; rostedt@goodmis.org; bsegall@google.com;
> mgorman@suse.de; vschneid@redhat.com; kprateek.nayak@amd.com;
> linux-kernel@vger.kernel.org; jianyong.wu@outlook.com; Yibin Liu
> <liuyibin@hygon.cn>; Yuan Zhong <zhongyuan@hygon.cn>;
> chen.yu@linux.dev
> Subject: Re: [PATCH v2] sched/cache: Enable LLC aggregation above the fir=
st
> NUMA level
>=20
> Hello Jianyong,
>=20
> On Thu, Nov 12, 2026 at 02:54:45PM +0800, Jianyong Wu wrote:
> > sched_balance_find_src_group() only considers group_llc_balance when
> > sds.prefer_sibling is set:
> >
> > 	if (sds.prefer_sibling && local->group_type =3D=3D group_has_spare &&
> > 	    (busiest->group_type =3D=3D group_llc_balance ||
> > 	     sibling_imbalance(env, &sds, busiest, local) > 1))
> > 		goto force_balance;
> >
> > sds.prefer_sibling mirrors SD_PREFER_SIBLING of the busiest group's
> > child sched domain, and sd_init() clears that flag on every SD_NUMA
> > domain. So on any domain whose child is itself a NUMA domain, i.e. on
> > systems with more than one NUMA level such as multiple nodes per
> > socket, groups tagged with group_llc_balance by llc_balance() can
> > never take the force_balance path.
> >
> > Such a group falls into the !group_overloaded branch below and in the
> > common case ends up in out_balanced, so a task that was placed
> beyond
> > the first NUMA level is never pulled into its preferred LLC.
> >
> > Only require sds.prefer_sibling for the sibling_imbalance() case,
> > which is what it was originally introduced for.
> >
> > Split the condition into two explicit tests and gate the llc_balance
> > one on sched_cache_enabled(), so that the non cache aware case never
> > reads the group type, and the test disappears at compile time when
> > CONFIG_SCHED_CACHE is off.
> >
> > Reported-by: Yibin Liu <liuyibin@hygon.cn>
> > Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> > Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> > ---
> > v1 -> v2:
> > - Split the condition into two tests and gate the llc_balance one on
> >   sched_cache_enabled() via busiest_llc_balance() (Tim Chen).
> > - Add schbench/hackbench results with NUMA balancing enabled and
> >   disabled (Chen Yu).
> > - Reword the subject and drop the Fixes tag: this enables aggregation
> >   above the first NUMA level rather than fixing a bug (Chen Yu).
> >
> > v1:
> https://lore.kernel.org/all/20261104141313.185433-1-wujianyong@hygon.c
> n/
> >
>=20
> [ ... ]
>=20
> >  kernel/sched/fair.c | 35 +++++++++++++++++++++++++++--------
> >  1 file changed, 27 insertions(+), 8 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index cfc982205b98..01b9f7885574 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -12192,6 +12192,16 @@ static bool update_llc_busiest(struct lb_env
> *env,
> >  	 */
> >  	return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
> >  }
> > +
> > +/*
> > + * The busiest group has tasks that prefer the destination LLC and
> > + * cache aware scheduling is enabled.
> > + */
> > +static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
> > +{
> > +	return sched_cache_enabled() &&
> > +	       busiest->group_type =3D=3D group_llc_balance;
> > +}
> >  #else
> >  static inline void record_sg_llc_stats(struct lb_env *env, struct
> sg_lb_stats *sgs,
> >  				       struct sched_group *group)
> > @@ -12210,6 +12220,11 @@ static bool update_llc_busiest(struct lb_env
> *env,
> >  {
> >  	return false;
> >  }
> > +
> > +static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
> > +{
> > +	return false;
> > +}
> >  #endif
> >
> >  /**
> > @@ -13303,14 +13318,18 @@ static struct sched_group
> *sched_balance_find_src_group(struct lb_env *env)
> >  			goto out_balanced;
> >  	}
> >
> > -	/*
> > -	 * Try to move all excess tasks to a sibling domain of the busiest
> > -	 * group's child domain.
> > -	 */
> > -	if (sds.prefer_sibling && local->group_type =3D=3D group_has_spare &&
> > -	    (busiest->group_type =3D=3D group_llc_balance ||
> > -	    sibling_imbalance(env, &sds, busiest, local) > 1))
> > -		goto force_balance;
> > +	if (local->group_type =3D=3D group_has_spare) {
> > +		if (busiest_llc_balance(busiest))
> > +			goto force_balance;
> > +
> > +		/*
> > +		 * Try to move all excess tasks to a sibling domain of the
> > +		 * busiest group's child domain.
> > +		 */
> > +		if (sds.prefer_sibling &&
> > +		    sibling_imbalance(env, &sds, busiest, local) > 1)
> > +			goto force_balance;
> > +	}
> >
> >  	if (busiest->group_type !=3D group_overloaded) {
> >  		if (!env->idle) {
> >
>=20
> Got one question below. After cache-aware scheduling is enabled at NUMA
> level 2,
> should we adjust src_cpu in llc_balance()?
>=20
> Suppose there are 4 NUMA nodes, N1, N2, N3, and N4. Under each NUMA
> node, there are
> sub-NUMA nodes, say N1.1, N1.2, and N2.1, N2.2, and so on.
>=20
> Before this patch, cache-aware scheduling is allowed to aggregate tasks
> between N1.1
> and N1.2, but not between N1 and Nx. With this patch applied, it becomes
> legal to
> aggregate tasks between N1 and Nx.
>=20
> Consider N1 as the dst_group. Then we try to find the Nx group as the
> busiest src_group.
> Say we choose N2 as the busiest one. Then in llc_balance(), we evaluate
> the utilization
> between the LLC containing env->dst_cpu and the LLC containing
> cpumask_first(sched_group_span(N2)).
> The latter always returns the first CPU in N2.1, which might be wrong,
> because the busiest could
> be N2.2 as well.
>=20
> So, we might want to use the busiest CPU in the busiest N2 rather than th=
e
> first CPU in the
> busiest N2, how about something like below:
>=20
This is an existing issue, I think, even before this patch.

Suppose we have a system with multiple NUMA nodes, each node with multiple =
LLCs.
When balancing between NUMA nodes, we need to decide whether a NUMA node ca=
n be
tagged with group_llc_balance using llc_balance(). Then the issue you descr=
ibed
above occurs.

I think your code fixes an inconsistency here. Once a sched group with mult=
iple
LLCs is passed to llc_balance(), we use the first LLC inside the group to d=
o the
check, while in sched_balance_find_src_rq() we pick the rq whose tasks most=
 prefer
the dst LLC. But they may not be the same LLC. That is to say, we decide wh=
ether a
group should be tagged with group_llc_balance using one LLC, and then we pi=
ck a
task from another LLC to migrate.

With your approach, if we choose the rq with the most preferred tasks to do=
 the
llc_balance() check, it is consistent with how we pick the src rq afterward=
s.

So I think we need this fix but it is independent of my patch here.

Thanks
Jianyong


> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 79f6b3a4fd7f..f2f15b20e3c7 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12149,7 +12149,7 @@ static void record_sg_llc_stats(struct lb_env
> *env,
>   * to run on LLC in idle dst_cpu.
>   */
>  static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *s=
gs,
> -			       struct sched_group *group)
> +			       int src_cpu)
>  {
>  	if (!sched_cache_enabled())
>  		return false;
> @@ -12183,8 +12183,7 @@ static inline bool llc_balance(struct lb_env
> *env, struct sg_lb_stats *sgs,
>  		return false;
>=20
>  	if (sgs->nr_pref_dst_llc &&
> -	    can_migrate_llc(cpumask_first(sched_group_span(group)),
> -			    env->dst_cpu, 0, true) =3D=3D mig_llc)
> +	    can_migrate_llc(src_cpu, env->dst_cpu, 0, true) =3D=3D mig_llc)
>  		return true;
>=20
>  	return false;
> @@ -12235,6 +12234,8 @@ static inline void update_sg_lb_stats(struct
> lb_env *env,
>  {
>  	int i, nr_running, local_group, sd_flags =3D env->sd->flags;
>  	bool balancing_at_rd =3D !env->sd->parent;
> +	unsigned int max_pref_nr =3D 0;
> +	int max_pref_cpu =3D -1;
>=20
>  	memset(sgs, 0, sizeof(*sgs));
>=20
> @@ -12258,13 +12259,20 @@ static inline void update_sg_lb_stats(struct
> lb_env *env,
>  #ifdef CONFIG_SCHED_CACHE
>  		if (sched_cache_enabled()) {
>  			struct sched_domain *sd_tmp;
> +			unsigned int nr_pref;
>  			int dst_llc;
>=20
>  			dst_llc =3D llc_id(env->dst_cpu);
>  			if (llc_id(i) !=3D dst_llc) {
>  				sd_tmp =3D rcu_dereference_all(rq->sd);
> -				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max)
> -					sgs->nr_pref_dst_llc +=3D sd_tmp->llc_counts[dst_llc];
> +				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max) {
> +					nr_pref =3D sd_tmp->llc_counts[dst_llc];
> +					sgs->nr_pref_dst_llc +=3D nr_pref;
> +					if (nr_pref > max_pref_nr) {
> +						max_pref_nr =3D nr_pref;
> +						max_pref_cpu =3D i;
> +					}
> +				}
>  			}
>  		}
>  #endif
> @@ -12335,7 +12343,7 @@ static inline void update_sg_lb_stats(struct
> lb_env *env,
>  			sgs->group_smt_balance =3D 1;
>=20
>  		/* Check for tasks in this group can be moved to their preferred
> LLC */
> -		if (llc_balance(env, sgs, group))
> +		if (llc_balance(env, sgs, max_pref_cpu))
>  			sgs->group_llc_balance =3D 1;
>  	}
>=20
> --
> 2.43.0
>=20
>=20


